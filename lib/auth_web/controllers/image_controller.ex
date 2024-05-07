 defmodule AuthWeb.ImageController do
  use AuthWeb, :controller

  def show_img_with_full_image_path(image_path) do
    req_body_img_2_Base64(image_path)
  end

  def show_img_with_profile_img_path(image_path) do
    req_body_img_2_Base64("users/profile_images/#{image_path}")
  end

  def img_url_to_base64(image_url) do
    [_, image_filepath] = String.split(image_url, "amazonaws.com/")
    req_body_img_2_Base64(image_filepath)
  end

  @doc """
    Faz o upload da imagem do perfil do usuário para o AWS S3.
    username -> sem o "@"
  """
  def upload_profile_image(%Plug.Upload{} = upload, username) do
    {:ok, file_content} = File.read(upload.path)
    file_path_to_s3 = "users/profile_images/#{username}.#{ext(upload.content_type)}"

    ExAws.S3.put_object(System.get_env("AWS_BUCKET"), file_path_to_s3, file_content)
    |> ExAws.request!()

    # Retorna a URL da imagem no S3
    # "http://#{System.get_env("AWS_BUCKET")}.s3.#{System.get_env("AWS_REGION")}.amazonaws.com/#{file_path_to_s3}"

    # Retorna o filepath da imagem p/ atualizar no banco de dados (no campo 'profile_img_path')
    "#{username}.#{ext(upload.content_type)}"
  end


  @doc """
    Salva o arquivo no diretorio `profile_images`
  """
  def handle_image_upload(%Plug.Upload{} = upload) do
    target = "priv/static/images/profile_images/#{upload.filename}"
    File.cp(upload.path, target)
  end

  defp req_body_img_2_Base64(image_path) do
    image_extension = get_extension(image_path)

    image_binary =
     System.get_env("AWS_BUCKET")
      |> ExAws.S3.get_object(image_path)
      |> ExAws.request!
      |> Map.get(:body)

    "data:image/#{image_extension};base64,#{Base.encode64(image_binary)}"
  end

  defp get_extension(file_path) do
    Regex.scan(~r/\..{3,4}$/, file_path) |> hd |> hd |> String.slice(1..-1//1)
  end

  defp ext(content_type) do
    [ext | _] = MIME.extensions(content_type)
    ext
  end
end
