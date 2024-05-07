defmodule Auth.SimpleS3Upload do
  
  """
  def sign_form_upload(config, bucket, opts) do
    key = Keyword.fetch!(opts, :key)
    max_file_size = Keyword.fetch!(opts, :max_file_size)
    content_type = Keyword.fetch!(opts, :content_type)
    expires_in = Keyword.fetch!(opts, :expires_in)

    expires_at = DateTime.add(DateTime.utc_now(), expires_in, :millisecond)
    amz_date = amz_date(expires_at)
    credential = credential(config, expires_at)

    encoded_policy =
      Base.encode64("""
      {
        "expiration": "#{DateTime.to_iso8601(expires_at)}",
        "conditions": [
          {"bucket":  "#{bucket}"},
          ["eq", "$key", "#{key}"],
          {"acl": "public-read"},
          ["eq", "$Content-Type", "#{content_type}"],
          ["content-length-range", 0, #{max_file_size}],
          {"x-amz-server-side-encryption": "AES256"},
          {"x-amz-credential": "#{credential}"},
          {"x-amz-algorithm": "AWS4-HMAC-SHA256"},
          {"x-amz-date": "#{amz_date}"}
        ]
      }
      """)

    fields = %{
      "key" => key,
      "acl" => "public-read",
      "content-type" => content_type,
      "x-amz-server-side-encryption" => "AES256",
      "x-amz-credential" => credential,
      "x-amz-algorithm" => "AWS4-HMAC-SHA256",
      "x-amz-date" => amz_date,
      "policy" => encoded_policy,
      "x-amz-signature" => signature(config, expires_at, encoded_policy)
    }

    {:ok, fields}
  end

  defp amz_date(time) do
    time
    |> NaiveDateTime.to_iso8601()
    |> String.split(".")
    |> List.first()
    |> String.replace("-", "")
    |> String.replace(":", "")
    |> Kernel.<>("Z")
  end

  defp credential(%{} = config, %DateTime{} = expires_at) do
    "#{config.access_key_id}/#{short_date(expires_at)}/#{config.region}/s3/aws4_request"
  end

  defp signature(config, %DateTime{} = expires_at, encoded_policy) do
    config
    |> signing_key(expires_at, "s3")
    |> sha256(encoded_policy)
    |> Base.encode16(case: :lower)
  end

  defp signing_key(%{} = config, %DateTime{} = expires_at, service) when service in ["s3"] do
    amz_date = short_date(expires_at)
    %{secret_access_key: secret, region: region} = config

    ("AWS4" <> secret)
    |> sha256(amz_date)
    |> sha256(region)
    |> sha256(service)
    |> sha256("aws4_request")
  end

  defp short_date(%DateTime{} = expires_at) do
    expires_at
    |> amz_date()
    |> String.slice(0..7)
  end

  defp sha256(secret, msg), do: :crypto.mac(:hmac, :sha256, secret, msg)



  def ext(entry) do
    [ext | _] = MIME.extensions(entry.client_type)
    ext
  end

  def entry_url(user_id, entry) do
    "http://#{System.get_env("AWS_BUCKET")}.s3.#{System.get_env("AWS_REGION")}.amazonaws.com/posts/media/#{user_id}/#{entry.uuid}.#{ext(entry)}"
  end


  def presign_upload(entry, socket) do
    user_id = socket.assigns.current_user.id
    uploads = socket.assigns.uploads
    key = "posts/media/#{user_id}/#{entry.uuid}.#{ext(entry)}"

    config = %{
      access_key_id: System.get_env("AWS_ACCESS_KEY_ID"),
      secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY"),
      region: System.get_env("AWS_REGION")
    }

    {:ok, fields} =
      sign_form_upload(config, System.get_env("AWS_BUCKET"),
        key: key,
        content_type: entry.client_type,
        max_file_size: uploads.img.max_file_size,
        expires_in: :timer.hours(1)
      )
    meta = %{uploader: "S3", key: key, url: "https://#{System.get_env("AWS_BUCKET")}.s3.amazonaws.com", fields: fields}
    {:ok, meta, socket}
  end

end
