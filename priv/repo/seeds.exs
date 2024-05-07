# Script for populating the database. You can run it as:
#     mix run priv/repo/seeds.exs

alias Auth.Accounts

# email
# username
# name
# lastname
# bio
# password

# profission: "",
# endereco: "",
# phone: "",
# email_prof: "",
# instagram: "",
# linkedin: "",
# facebook: "",

# profile_img: "", # image in binary
# profile_img_path: "", # path to image

Accounts.create_user_roles(%{
   email: "samuel@gmail.com",
   username: "@samuel06santos",
   name: "Samuel",
   lastname: "Santos",
   bio: "Discente do curso de bacharelado de Sistemas de Informação | ICEN - UFPA.",
   password: "123456",
   profission: "Estudante",
   endereco: "",
   phone: "(91) 9 9394-5450",
   email_prof: "joao.dias.santos@icen.ufpa.br",
   instagram: "@samuel06santos",
   linkedin: "/samuel-santos-7b534624b",
   facebook: "/samuel06santos",
   profile_img_path: "samuel06santos.png",
   },
   :admin
)

Accounts.create_user_roles(%{
   email: "renatohidaka@gmail.com",
   username: "@renatohidaka",
   name: "Renato",
   lastname: "Hidaka",
   bio: "Docente do quadro permanente do Instituto de Ciências Exatas e Naturais da Universidade Federal do Pará.",
   password: "123456",
   profission: "Professor",
   endereco: "Universidade Federal do Pará, Instituto de Ciências Exatas e Naturais - ICEN. Rua Augusto Corrêa, 01 Guamá 66075110 - Belém, PA - Brasil",
   phone: "(91) 3212-3456 / (91) 98398-9796",
   email_prof: "renatohidaka@ufpa.br",
   instagram: "@renatohidaka",
   linkedin: "/renato-hidaka-aa352019",
   facebook: "/renato_hidaka",
   profile_img_path: "renatohidaka.gif",
   },
   :admin
)


Accounts.create_user_roles(%{
   email: "julianalima@gmail.com",
   username: "@julianalima",
   name: "Juliana",
   lastname: "Lima",
   bio: "Estudante de Medicina na Universidade Federal de São Paulo",
   password: "123456",
   profission: "Estudante de Medicina",
   endereco: "Universidade Federal de São Paulo, Rua Pedro de Toledo, 650 - Vila Clementino, São Paulo - SP, 04039-032, Brasil",
   phone: "(11) 98765-4321",
   email_prof: "julianalima@unifesp.br",
   instagram: "@julianalima",
   linkedin: "/juliana-lima-123456",
   facebook: "/julianalima",
   profile_img_path: "julianalima.png",
   },
   :normal
)
Accounts.create_user_roles(%{
   email: "camilasilva@gmail.com",
   username: "@psicologacamila",
   name: "Camila",
   lastname: "Silva",
   bio: "Psicóloga especializada em cuidado de pessoas com necessidades especiais",
   password: "123456",
   profission: "Psicóloga",
   endereco: "Rua dos Profissionais, 123 - Bairro Terapêutico, São Paulo - SP - Brasil",
   phone: "(11) 98765-4321",
   email_prof: "psicologa.camila@fakemail.com",
   instagram: "@psicologacamila",
   linkedin: "/camila-silva",
   facebook: "/camilasilva",
   profile_img_path: "psicologacamila.png",
   },
   :normal
)

   Accounts.create_user_roles(%{
   email: "lucianasantos@gmail.com",
   username: "@fonoaudiologaluciana",
   name: "Luciana",
   lastname: "Santos",
   bio: "Fonoaudióloga especializada em cuidado de pessoas com necessidades especiais",
   password: "123456",
   profission: "Fonoaudióloga",
   endereco: "Avenida dos Especialistas, 456 - Bairro Comunicação, São Paulo - SP - Brasil",
   phone: "(11) 98765-4321",
   email_prof: "fonoaudiologa.luciana@fakemail.com",
   instagram: "@fonoaudiologaluciana",
   linkedin: "/luciana-santos",
   facebook: "/lucianasantos",
   profile_img_path: "fonoaudiologaluciana.png",
   },
   :normal
)

   Accounts.create_user_roles(%{
   email: "rafaelmendes@gmail.com",
   username: "@terapeutarafael",
   name: "Rafael",
   lastname: "Mendes",
   bio: "Terapeuta ocupacional especializado em cuidado de pessoas com necessidades especiais",
   password: "123456",
   profission: "Terapeuta Ocupacional",
   endereco: "Rua dos Cuidadores, 789 - Bairro Inclusão, São Paulo - SP - Brasil",
   phone: "(11) 98765-4321",
   email_prof: "terapeuta.rafael@fakemail.com",
   instagram: "@terapeutarafael",
   linkedin: "/rafael-mendes",
   facebook: "/rafaelmendes",
   profile_img_path: "terapeutarafael.png",
   },
   :normal
)

   Accounts.create_user_roles(%{
   email: "fernandaalmeida@gmail.com",
   username: "@psiquiatrafernanda",
   name: "Fernanda",
   lastname: "Almeida",
   bio: "Psiquiatra especializada em cuidado de pessoas com necessidades especiais",
   password: "123456",
   profission: "Psiquiatra",
   endereco: "Avenida dos Especialistas, 987 - Bairro Saúde Mental, São Paulo - SP - Brasil",
   phone: "(11) 98765-4321",
   email_prof: "psiquiatra.fernanda@fakemail.com",
   instagram: "@psiquiatrafernanda",
   linkedin: "/fernanda-almeida",
   facebook: "/fernandaalmeida",
   profile_img_path: "psiquiatrafernanda.png",
   },
   :normal
)

   Accounts.create_user_roles(%{
   email: "patriciaoliveira@gmail.com",
   username: "@enfermeirapatricia",
   name: "Patrícia",
   lastname: "Oliveira",
   bio: "Enfermeira especializada em cuidado de pessoas com necessidades especiais",
   password: "123456",
   profission: "Enfermeira",
   endereco: "Rua dos Cuidadores, 246 - Bairro Cuidado, São Paulo - SP - Brasil",
   phone: "(11) 98765-4321",
   email_prof: "enfermeira.patricia@fakemail.com",
   instagram: "@enfermeirapatricia",
   linkedin: "/patricia-oliveira",
   facebook: "/patriciaoliveira",
   profile_img_path: "enfermeirapatricia.png",
   },
   :normal
)

Accounts.create_user_roles(%{
   email: "ruth@gmail.com",
   username: "@ruthfarmacias",
   name: "Ruth",
   lastname: "Pereira",
   bio: "Bacharel em Farmácia pela Faculdade Uninta Sobral - Ceará",
   password: "123456",
   profission: "Farmacêutica",
   endereco: "Av. Desembargador Paulo Frota S/N Cond. Cidade Cristal, n° 1-2 andar. Bairro: Val de Cães, Belém do Pará, CEP 66040-480",
   phone: "(88) 9 4141-0361",
   email_prof: "farmaceutica.anaruth@fakemail.com",
   instagram: "@ruthfarmacias",
   linkedin: "/ana_ruth-91087057",
   facebook: "/ana_ruth",
   profile_img_path: "ruthfarmacias.png",
   },
   :normal
)

Accounts.create_user_roles(%{
   email: "marjorie@gmail.com",
   username: "@fisiomarjoriefreitas",
   name: "Marjorie",
   lastname: "Freitas",
   bio: "Bacharel em fisioterapia, especialista em Neurociência e Comportamento, experiência em atendimento fisioterapêutico clínico neurofuncional, formação completa e experiente atuação com o Método Intensivo Therasuit.",
   password: "123456",
   profission: "Neurocientista",
   endereco: "Av. Desembargador Paulo Frota S/N Cond. Cidade Cristal, n° 1-2 andar. Bairro: Val de Cães, Belém do Pará, CEP 66040-480",
   phone: "(91) 4141-0361",
   email_prof: "marjorie@fakemail.com",
   instagram: "@fisiomarjoriefreitas",
   linkedin: "/marjorie-freitas-91087057/",
   facebook: "/marjorie-freitas",
   profile_img_path: "fisiomarjoriefreitas.png",
   },
   :normal
)


### Instacrowler Users

Accounts.create_user_roles(%{
   email: "carolinealves.psi@gmail.com",
   username: "@carolinealves.psi",
   name: "Caroline",
   lastname: "Alves",
   bio: "Vamos pensar sobre si e transformar relações🌻
Psicóloga 10/09121
Pós graduanda em intervenção ABA em TEA e DI.
Belém - Pará",
   password: "123456",
   profission: "Psicóloga",
   endereco: "",
   phone: "",
   email_prof: "carolinealves.psi@gmail.com",
   instagram: "@carolinealves.psi",
   linkedin: "",
   facebook: "",
   profile_img_path: "carolinealves.psi.png",
},
   :normal
)


Accounts.create_user_roles(%{
  email: "isabelarego.fisio@gmail.com",
  username: "@isabelarego.fisio",
  name: "Isabela",
  lastname: "Rêgo",
  bio: "Fisioterapeuta 🧠
TheraSuit Method®️",
  password: "123456",
  profission: "Fisioterapeuta",
  endereco: "",
  phone: "",
  email_prof: "isabelarego.fisio@gmail.com",
  instagram: "@isabelarego.fisio",
  linkedin: "",
  facebook: "",
  profile_img_path: "isabelarego.fisio.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "euelainepimentel@gmail.com",
  username: "@euelainepimentel",
  name: "Elaine",
  lastname: "Pimentel",
  bio: "Assistente social🌹
  👩‍🎓Pós graduanda em Psicopedagogia clínica
  🕵️‍♀️Descobrindo o TDAH",
  password: "123456",
  profission: "Assistente social",
  endereco: "",
  phone: "",
  email_prof: "euelainepimentel@gmail.com",
  instagram: "@euelainepimentel",
  linkedin: "",
  facebook: "",
  profile_img_path: "euelainepimentel.png",
},
   :normal
)


Accounts.create_user_roles(%{
  email: "anitabritooficial@gmail.com",
  username: "@anitabritooficial",
  name: "Anita",
  lastname: "Brito,",
  bio: "Pós-doutoranda em Neurobiologia do TEA -USP
Doutora em Neurociências - USP.
Escritora
Mãe do Nicolas e do Guilherme
Esposa do Alexsander
Feliz ♥️",
  password: "123456",
  profission: "Neurobióloga",
  endereco: "",
  phone: "",
  email_prof: "anitabritooficial@gmail.com",
  instagram: "@anitabritooficial",
  linkedin: "",
  facebook: "",
  profile_img_path: "anitabritooficial.png",
  },
  :normal
)


  Accounts.create_user_roles(%{
  email: "psidaisymedeiros@gmail.com",
  username: "@psidaisymedeiros",
  name: "Daisy",
  lastname: "Medeiros",
  bio: "🧠 Psicóloga - CRP 10/08042
📊 Analista do Comportamento
🧩 Especialista em ABA
📝 Mestranda UFPA
📚 Pesquisadora NTPC",
  password: "123456",
  profission: "Psicóloga",
  endereco: "",
  phone: "",
  email_prof: "psidaisymedeiros@gmail.com",
  instagram: "@psidaisymedeiros",
  linkedin: "",
  facebook: "",
  profile_img_path: "psidaisymedeiros.png",
  },
  :normal
)


Accounts.create_user_roles(%{
  email: "psi.fabianepereira@gmail.com",
  username: "@psi.fabianepereira",
  name: "Fabiane",
  lastname: "Pereira",
  bio: "🌻 Dra. Fabiane Pereira (CRP 10/6388)
🌻 Levando ACT para profissionais da saúde
💡Flexibilidade Psicológica",
  password: "123456",
  profission: "Psicóloga",
  endereco: "",
  phone: "",
  email_prof: "psi.fabianepereira@gmail.com",
  instagram: "@psi.fabianepereira",
  linkedin: "",
  facebook: "",
  profile_img_path: "psi.fabianepereira.png",
  },
  :normal
)


Accounts.create_user_roles(%{
  email: "alfaiaadvocaciaespecializada@gmail.com",
  username: "@alfaiaadvocaciaespecializada",
  name: "Raissa",
  lastname: "Alfaia",
  bio: "⚖ Especialista em Direto da saúde
  🩺 Facilitando o acesso ao melhor tratamento médico
  🇧🇷Atendimento em todo Brasil",
  password: "123456",
  profission: "Advogada",
  endereco: "",
  phone: "",
  email_prof: "alfaiaadvocaciaespecializada@gmail.com",
  instagram: "@alfaiaadvocaciaespecializada",
  linkedin: "",
  facebook: "",
  profile_img_path: "alfaiaadvocaciaespecializada.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "anacarolinapina@gmail.com",
  username: "@anacarolinapina",
  name: "Ana",
  lastname: "Carolina",
  bio: "Fisioterapeuta
RTA avançado em pediatria
Belém-Pará
Uma flor não se preocupa em competir com as flores ao lado, ela apenas floresce.🌷",
  password: "123456",
  profission: "Fisioterapeuta",
  endereco: "",
  phone: "",
  email_prof: "anacarolinapina@gmail.com",
  instagram: "@anacarolinapina",
  linkedin: "",
  facebook: "",
  profile_img_path: "anacarolinapina.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "andreacastanho.fisio@gmail.com",
  username: "@andreacastanho.fisio",
  name: "Andrea",
  lastname: "Castanho",
  bio: "Fisioterapeuta especializada em reabilitação neurofuncional através do método Therasuit e conceito neuro evolutivo Bobath e hidroterapia",
  password: "123456",
  profission: "Fisioterapeuta",
  endereco: "",
  phone: "",
  email_prof: "andreacastanho.fisio@gmail.com",
  instagram: "@andreacastanho.fisio",
  linkedin: "",
  facebook: "",
  profile_img_path: "andreacastanho.fisio.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "marthalves_@gmail.com",
  username: "@marthalves_",
  name: "Martha",
  lastname: "Alves",
  bio: "Pedagoga
  Terapeuta infantil
  Graduanda em psicopedagogia baseada em Aba
  Católica
  Perfil Profissional: @pedagogamartha",
  password: "123456",
  profission: "Pedagoga",
  endereco: "",
  phone: "",
  email_prof: "marthalves_@gmail.com",
  instagram: "@marthalves_",
  linkedin: "",
  facebook: "",
  profile_img_path: "marthalves_.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "luizfisio@gmail.com",
  username: "@luizfisio",
  name: "Luiz",
  lastname: "Freires",
  bio: "Perfil Pessoal | @luizfreires_ 📸
• Acadêmico de Fisioterapia | 80% ...💚
• Instrutor de Pilates | 🤸🏽‍♂️
• Belém/PA | 🇧🇷
AUTO-CURA  | OSTEOPATIA",
  password: "123456",
  profission: "Fisioterapeuta",
  endereco: "",
  phone: "",
  email_prof: "luizfisio@gmail.com",
  instagram: "@luizfisio",
  linkedin: "",
  facebook: "",
  profile_img_path: "luizfisio.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "o_araujojoao@gmail.com",
  username: "@o_araujojoao",
  name: "Joao",
  lastname: "Araujo",
  bio: "Psipedagogo 📝
▫️Terapeuta ABA 🧩
▫️ Especialista em intervenção ABA para TEA
▫️ Supervisor ✍️",
  password: "123456",
  profission: "Psipedagogo",
  endereco: "",
  phone: "",
  email_prof: "o_araujojoao@gmail.com",
  instagram: "@o_araujojoao",
  linkedin: "",
  facebook: "",
  profile_img_path: "o_araujojoao.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "a_laura_menezes@gmail.com",
  username: "@a_laura_menezes",
  name: "Ana",
  lastname: "Laura",
  bio: "Fisioterapia 8/10💚🐍
  Senso de humor quebrado🫠
  @lafime.pa",
  password: "123456",
  profission: "Fisioterapeuta",
  endereco: "",
  phone: "",
  email_prof: "a_laura_menezes@gmail.com",
  instagram: "@a_laura_menezes",
  linkedin: "",
  facebook: "",
  profile_img_path: "a_laura_menezes.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "lceymard@gmail.com",
  username: "@lceymard",
  name: "Lucas",
  lastname: "Eymard",
  bio: "Belém, ♊
Uma paixão por desafios !
📚Acadêmico de fisioterapia  8/10👨‍🏫",
  password: "123456",
  profission: "Fisioterapeuta",
  endereco: "",
  phone: "",
  email_prof: "lceymard@gmail.com",
  instagram: "@lceymard",
  linkedin: "",
  facebook: "",
  profile_img_path: "lceymard.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "fisiothaynaraoliveira@gmail.com",
  username: "@fisiothaynaraoliveira",
  name: "Thaynara",
  lastname: "Oliveira",
  bio: "Reabilitação neurofuncional  🧠método therasuit 🇺🇸; Reabilitação baixa visão e Cegueira; Reequilíbrio toracoabdominal 🫁 reabilitaoneurologica",
  password: "123456",
  profission: "Fisioterapeuta",
  endereco: "",
  phone: "",
  email_prof: "fisiothaynaraoliveira@gmail.com",
  instagram: "@fisiothaynaraoliveira",
  linkedin: "",
  facebook: "",
  profile_img_path: "fisiothaynaraoliveira.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "dratayanamedeiros@gmail.com",
  username: "@dratayanamedeiros",
  name: "Tayana",
  lastname: "Medeiros",
  bio: "🦷 | Odontologia, simpatia e amor 🧡
☺️ | Especialista em pacientes especiais!
⬇️ | Agende no link abaixo
CroPa- 4372",
  password: "123456",
  profission: "Odontopediatra",
  endereco: "",
  phone: "",
  email_prof: "dratayanamedeiros@gmail.com",
  instagram: "@dratayanamedeiros",
  linkedin: "",
  facebook: "",
  profile_img_path: "dratayanamedeiros.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "tarsots@gmail.com",
  username: "@tarsots",
  name: "Tarso",
  lastname: "Tsuyoshi",
  bio: "Terapeuta Ocupacional pela UFPA.
Habilitado nos métodos MIG e TREINI.
Pós graduando em Intervenção ABA para Transtorno do Espectro Autista (TEA).",
  password: "123456",
  profission: "Terapeuta Ocupacional",
  endereco: "",
  phone: "",
  email_prof: "tarsots@gmail.com",
  instagram: "@tarsots",
  linkedin: "",
  facebook: "",
  profile_img_path: "tarsots.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "vitor.hrc.castro@gmail.com",
  username: "@vitor.hrc.castro",
  name: "Vitor",
  lastname: "Hugo",
  bio: "•Fisioterapia 4/10⚡🐍
•Diretor de marketing da @lafime.pa
•Estagiário da clínica Therasuit Studio
•Membro da comissão do CREFITO-Jovem
•Bolsista PIBIC",
  password: "123456",
  profission: "Fisioterapeuta",
  endereco: "",
  phone: "",
  email_prof: "vitor.hrc.castro@gmail.com",
  instagram: "@vitor.hrc.castro",
  linkedin: "",
  facebook: "",
  profile_img_path: "vitor.hrc.castro.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "fisiolidicesilva@gmail.com",
  username: "@fisiolidicesilva",
  name: "Lídice",
  lastname: "Silva",
  bio: "📌Fisioterapeuta
📌 Advanced Method Therasuit
📌 PNF
📌 Método RTA
📌 Terapias Manuais
📌 Atendimento online
Mais informações? Chama no direct",
  password: "123456",
  profission: "Fisioterapeuta",
  endereco: "",
  phone: "",
  email_prof: "fisiolidicesilva@gmail.com",
  instagram: "@fisiolidicesilva",
  linkedin: "",
  facebook: "",
  profile_img_path: "fisiolidicesilva.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "drericknunes@gmail.com",
  username: "@drericknunes",
  name: "Erick",
  lastname: "Nunes",
  bio: "💡Médico e Empreendedor
🚀Fundador do @movimedpa
🎯Incansável na missão cuidar de você!",
  password: "123456",
  profission: "Médico",
  endereco: "",
  phone: "",
  email_prof: "drericknunes@gmail.com",
  instagram: "@drericknunes",
  linkedin: "",
  facebook: "",
  profile_img_path: "drericknunes.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "amadorney@gmail.com",
  username: "@amadorney",
  name: "Ney",
  lastname: "Amador",
  bio: "Seguindo o dia e curtindo a vida.
Fisioterapeuta. @fisioneyamador
34 anos.
De virgem. ♍
Não tenho nada contra gatos 🐈
Mas prefiro cachorros 🐕🐶",
  password: "123456",
  profission: "Fisioterapeuta",
  endereco: "",
  phone: "",
  email_prof: "amadorney@gmail.com",
  instagram: "@amadorney",
  linkedin: "",
  facebook: "",
  profile_img_path: "amadorney.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "tia.laura.at@gmail.com",
  username: "@tia.laura.at",
  name: "Tia",
  lastname: "Laura",
  bio: "Laura - Acompanhente Terapêutica",
  password: "123456",
  profission: "Acompanhante Terapêutica",
  endereco: "",
  phone: "",
  email_prof: "tia.laura.at@gmail.com",
  instagram: "@tia.laura.at",
  linkedin: "",
  facebook: "",
  profile_img_path: "tia.laura.at.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "isabellyabastos@gmail.com",
  username: "@isabellyabastos",
  name: "Isabelly",
  lastname: "Bastos",
  bio: "Terapeuta Ocupacional
Especialista em Análise do Comportamento Aplicada
Mestranda em Teoria e Pesquisa do Comportamento - UFPA
@linkcomportamental",
  password: "123456",
  profission: "Terapeuta Ocupacional",
  endereco: "",
  phone: "",
  email_prof: "isabellyabastos@gmail.com",
  instagram: "@isabellyabastos",
  linkedin: "",
  facebook: "",
  profile_img_path: "isabellyabastos.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "fisioviniciusferreira@gmail.com",
  username: "@fisioviniciusferreira",
  name: "Vinicius",
  lastname: "Ferreira",
  bio: "👨🏻‍⚕️Fisioterapeuta
📚Pós graduando em fisioterapia neurofuncional
📌Belém-Pa
Fisioterapia é vida. É movimento. É acreditar.",
  password: "123456",
  profission: "️Fisioterapeuta",
  endereco: "",
  phone: "",
  email_prof: "fisioviniciusferreira@gmail.com",
  instagram: "@fisioviniciusferreira",
  linkedin: "",
  facebook: "",
  profile_img_path: "fisioviniciusferreira.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "lay_almeidafisio@gmail.com",
  username: "@lay_almeidafisio",
  name: "Layane",
  lastname: "Almeida",
  bio: "👩🏻‍🎓 CREFITO 12-337219.F
🐴 Equoterapia
👂🏼 Auriculoterapia
📍 Belém/PA",
  password: "123456",
  profission: "️Fisioterapeuta",
  endereco: "",
  phone: "",
  email_prof: "lay_almeidafisio@gmail.com",
  instagram: "@lay_almeidafisio",
  linkedin: "",
  facebook: "",
  profile_img_path: "lay_almeidafisio.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "fisio_natashapereira@gmail.com",
  username: "@fisio_natashapereira",
  name: "Natasha",
  lastname: "Pereira",
  bio: "Dra Natasha Pereira, Bacharel em Fisioterapia pelo CESUPA, pós graduanda em Fisioterapia Neuro Funcional pela Inspirar, Watsu e auriculoterapia",
  password: "123456",
  profission: "️Fisioterapeuta",
  endereco: "",
  phone: "",
  email_prof: "fisio_natashapereira@gmail.com",
  instagram: "@fisio_natashapereira",
  linkedin: "",
  facebook: "",
  profile_img_path: "fisio_natashapereira.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "__tiarenatapsi@gmail.com",
  username: "@__tiarenatapsi",
  name: "Renata",
  lastname: "Costa",
  bio: "🌸Pós graduanda em análise do comportamento aplicada ✨
🌸Facilitadora escolar ✨
🌸Aplicadora Aba ✨",
  password: "123456",
  profission: "Psicóloga",
  endereco: "",
  phone: "",
  email_prof: "__tiarenatapsi@gmail.com",
  instagram: "@__tiarenatapsi",
  linkedin: "",
  facebook: "",
  profile_img_path: "__tiarenatapsi.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "psialefgomesb@gmail.com",
  username: "@psialefgomesb",
  name: "Alef",
  lastname: "Gomes",
  bio: "CRP:10/07395
Atuante nas áreas:
Psicoterapia infantil e adulto
Presencial ou online📓
Reabilitação Neuropsicológica ♿️
Terapeuta ABA ♾️
CRP 10/07395",
  password: "123456",
  profission: "Psicólogo",
  endereco: "",
  phone: "",
  email_prof: "psialefgomesb@gmail.com",
  instagram: "@psialefgomesb",
  linkedin: "",
  facebook: "",
  profile_img_path: "psialefgomesb.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "anapaulanobrel@gmail.com",
  username: "@anapaulanobrel",
  name: "Ana Paula",
  lastname: "Nobrel",
  bio: "Fonoaudióloga.
Belém ↔️ Cuiabá.
Perfil pessoal.",
  password: "123456",
  profission: "Fonoaudióloga",
  endereco: "",
  phone: "",
  email_prof: "anapaulanobrel@gmail.com",
  instagram: "@anapaulanobrel",
  linkedin: "",
  facebook: "",
  profile_img_path: "anapaulanobrel.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "fisiojessicaflima@gmail.com",
  username: "@fisiojessicaflima",
  name: "Jéssica",
  lastname: "Lima",
  bio: "👩🏼‍⚕️ Fisioterapeuta
🧠Reabilitação Neurofuncional
📍Therasuit advanced II Method-INFS
📍PNF
📍Pilates
📍RTA
📍Contenção induzida
💼 @therasuitbelem",
  password: "123456",
  profission: "Fisioterapeuta",
  endereco: "",
  phone: "",
  email_prof: "fisiojessicaflima@gmail.com",
  instagram: "@fisiojessicaflima",
  linkedin: "",
  facebook: "",
  profile_img_path: "fisiojessicaflima.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "otavio_estefani@gmail.com",
  username: "@otavio_estefani",
  name: "Otávio",
  lastname: "Estefani",
  bio: "Unesp Marília 🎓
Fisioterapeuta ⚡️🐍
Therasuit básico/prático/Avançado I 📖
Conceito neuroevolutivo Bobath 🧠
Neurologia infantil @intheravita💼",
  password: "123456",
  profission: "Fisioterapeuta",
  endereco: "",
  phone: "",
  email_prof: "otavio_estefani@gmail.com",
  instagram: "@otavio_estefani",
  linkedin: "",
  facebook: "",
  profile_img_path: "otavio_estefani.png",
},
  :normal
)


Accounts.create_user_roles(%{
email: "renatabraga01@gmail.com",
username: "@renatabraga01",
name: "Renata",
lastname: "Braga",
bio: "Neuropediatria Bobath/BaBy Bobath  GMFM Equoterapia Selote UTI Neo/Ped RTA Therasuit Dirflootame BRMT Eletroestimulação AIMS Feurstein",
password: "123456",
profission: "Neuropediatra",
endereco: "",
phone: "",
email_prof: "renatabraga01@gmail.com",
instagram: "@renatabraga01",
linkedin: "",
facebook: "",
profile_img_path: "renatabraga01.png",
},
:normal
)


Accounts.create_user_roles(%{
  email: "sayoriwu.to@gmail.com",
  username: "@sayoriwu.to",
  name: "Sayori",
  lastname: "Wu",
  bio: "Terapeuta Ocupacional e Analista do Comportamento
Esp. em Análise do Comportamento Aplicada
Mestre em Teoria e Pesquisa do Comportamento-UFPA
📍MS",
  password: "123456",
  profission: "Terapeuta Ocupacional",
  endereco: "",
  phone: "",
  email_prof: "sayoriwu.to@gmail.com",
  instagram: "@sayoriwu.to",
  linkedin: "",
  facebook: "",
  profile_img_path: "sayoriwu.to.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "brenomonteirod@gmail.com",
  username: "@brenomonteirod",
  name: "Breno",
  lastname: "Monteiro",
  bio: "Psicólogo AP/PA",
  password: "123456",
  profission: "Psicólogo",
  endereco: "",
  phone: "",
  email_prof: "brenomonteirod@gmail.com",
  instagram: "@brenomonteirod",
  linkedin: "",
  facebook: "",
  profile_img_path: "brenomonteirod.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "pedagogamartha@gmail.com",
  username: "@pedagogamartha",
  name: "Martha",
  lastname: "Alves",
  bio: "• Pedagoga
  • Graduanda em psicopedagogia baseada em Aba
  • Terapeuta infantil",
  password: "123456",
  profission: "Pedagoga",
  endereco: "",
  phone: "",
  email_prof: "pedagogamartha@gmail.com",
  instagram: "@pedagogamartha",
  linkedin: "",
  facebook: "",
  profile_img_path: "pedagogamartha.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "ronaldmmafraft@gmail.com",
  username: "@ronaldmmafraft",
  name: "Dr. Ronald",
  lastname: "Mafra",
  bio: "🧠TheraSuit Method
🧠PNF Concept
🧠Watsu Method
🧠Preceptor Proj. Ágape Saúde - CESUPA
🧠Pós Graduando em Neurociências, Ed. e Des. Infantil -PUC/RS",
  password: "123456",
  profission: "Fisioterapeuta",
  endereco: "",
  phone: "",
  email_prof: "ronaldmmafraft@gmail.com",
  instagram: "@ronaldmmafraft",
  linkedin: "",
  facebook: "",
  profile_img_path: "ronaldmmafraft.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "inclusive_sports_martial_arts@gmail.com",
  username: "@inclusive_sports_martial_arts",
  name: "Anderson",
  lastname: "Alves",
  bio: "📍Boaventura da Silva 1290 salas 305 e 306
Judô- Jiu-Jitsu-Ed.Física Adaptada 💚
📲(91)99371-1799 / 📥 Direct
Acolher, Compreender & Incluir.🥋",
  password: "123456",
  profission: "Educador Físico",
  endereco: "",
  phone: "",
  email_prof: "inclusive_sports_martial_arts@gmail.com",
  instagram: "@inclusive_sports_martial_arts",
  linkedin: "",
  facebook: "",
  profile_img_path: "inclusive_sports_martial_arts.png",
},
  :normal
)


Accounts.create_user_roles(%{
email: "o_eliasferreira@gmail.com",
username: "@o_eliasferreira",
name: "Elias",
lastname: "Ferreira",
bio: "•Psicólogo 🔱
•Análise do comportamento aplicada ao TEA. 🧩
•Mestrando: Teoria e Pesquisa do Comportamento 🐁
•Supervisão, treinamentos e consultoria. 📝",
password: "123456",
profission: "Psicólogo",
endereco: "",
phone: "",
email_prof: "o_eliasferreira@gmail.com",
instagram: "@o_eliasferreira",
linkedin: "",
facebook: "",
profile_img_path: "o_eliasferreira.png",
},
:normal
)


Accounts.create_user_roles(%{
  email: "amoserpediatra@gmail.com",
  username: "@amoserpediatra",
  name: "Luciana",
  lastname: "Mota Leonardi",
  bio: "Dra Luciana Mota Leonardi ❤️
  • consultas: (91) 99359-5707
  . Venha fazer parte do GRUPO MATERNAR DESCOMPLICADO.",
  password: "123456",
  profission: "Pediatra",
  endereco: "",
  phone: "(91) 99359-5707",
  email_prof: "amoserpediatra@gmail.com",
  instagram: "@amoserpediatra",
  linkedin: "",
  facebook: "",
  profile_img_path: "amoserpediatra.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "psiquiatra_masami_iida@gmail.com",
  username: "@psiquiatra_masami_iida",
  name: "Masami",
  lastname: "Iida",
  bio: "Médica Psiquiatra 🧠❤️
  Membro da Associação Brasileira de Psiquiatria 📚
  Te ajudo a cuidar da sua saúde mental e emocional 💡",
  password: "123456",
  profission: "Psiquiatra",
  endereco: "",
  phone: "",
  email_prof: "psiquiatra_masami_iida@gmail.com",
  instagram: "@psiquiatra_masami_iida",
  linkedin: "",
  facebook: "",
  profile_img_path: "psiquiatra_masami_iida.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "mattospsi@gmail.com",
  username: "@mattospsi",
  name: "Bruno",
  lastname: "Mattos",
  bio: "🧠| 10° semestre de Psicologia @faamoficial
📍| Paraense com muito orgulho
@psibrunomatos",
  password: "123456",
  profission: "Psicólogo",
  endereco: "",
  phone: "",
  email_prof: "mattospsi@gmail.com",
  instagram: "@mattospsi",
  linkedin: "",
  facebook: "",
  profile_img_path: "mattospsi.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "rebecadnz@gmail.com",
  username: "@rebecadnz",
  name: "Rebeca",
  lastname: "Diniz",
  bio: "🇧🇷
|Pedagoga
|Psicopedagoga
|Psicomotricista
|Especialista em intervenção ABA para TEA e DI 🧠
|Belém-PA📍",
  password: "123456",
  profission: "Psicopedagoga",
  endereco: "",
  phone: "",
  email_prof: "rebecadnz@gmail.com",
  instagram: "@rebecadnz",
  linkedin: "",
  facebook: "",
  profile_img_path: "rebecadnz.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "to.raphaelatorres@gmail.com",
  username: "@to.raphaelatorres",
  name: "Raphaela",
  lastname: "Torres",
  bio: "🎓 Terapeuta Ocupacional Pediátrica
🇧🇷 Certificação em Integração Sensorial
📚 Pós Graduanda em Neurociências",
  password: "123456",
  profission: "Terapeuta Ocupacional",
  endereco: "",
  phone: "",
  email_prof: "to.raphaelatorres@gmail.com",
  instagram: "@to.raphaelatorres",
  linkedin: "",
  facebook: "",
  profile_img_path: "to.raphaelatorres.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "tiakayla_@gmail.com",
  username: "@tiakayla_",
  name: "Kayla",
  lastname: "Micaele",
  bio: "Pedagoga, pós graduanda em Psicopedagogia baseada na Analise do Comportamento, Pós-graduanda em Psicomotricidade",
  password: "123456",
  profission: "Pedagoga",
  endereco: "",
  phone: "",
  email_prof: "tiakayla_@gmail.com",
  instagram: "@tiakayla_",
  linkedin: "",
  facebook: "",
  profile_img_path: "tiakayla_.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "to.annenascimento@gmail.com",
  username: "@to.annenascimento",
  name: "Anne",
  lastname: "Nascimento",
  bio: "✨ desenvolvimento infantil
💚 autonomia e independência
📍 belém - pa",
  password: "123456",
  profission: "Terapeuta Ocupacional",
  endereco: "",
  phone: "",
  email_prof: "to.annenascimento@gmail.com",
  instagram: "@to.annenascimento",
  linkedin: "",
  facebook: "",
  profile_img_path: "to.annenascimento.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "fonomayarastefany@gmail.com",
  username: "@fonomayarastefany",
  name: "Mayara",
  lastname: "Stefany",
  bio: "🎓 Fonoaudióloga Infantil - CRFa 5-12380
🧩 Especialista em Fonoaudiologia no TEA
🗣 Apraxia de Fala na Infância | 👄 PROMPT |📒 PECS
🏢 @unimed.palmas",
  password: "123456",
  profission: "Fonoaudióloga",
  endereco: "",
  phone: "",
  email_prof: "fonomayarastefany@gmail.com",
  instagram: "@fonomayarastefany",
  linkedin: "",
  facebook: "",
  profile_img_path: "fonomayarastefany.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "fonoellencaroline_@gmail.com",
  username: "@fonoellencaroline_",
  name: "Ellen",
  lastname: "Caroline",
  bio: "Filha de um Deus vivo🙏
  Fono 🧠
  Therasuit Method na Fonoaudiologia
  Pós-graduação em Autismo e ABA
  Pós-graduanda em Fono Neurofuncional
  @therasuitbelem",
  password: "123456",
  profission: "Fonoaudióloga",
  endereco: "",
  phone: "",
  email_prof: "fonoellencaroline_@gmail.com",
  instagram: "@fonoellencaroline_",
  linkedin: "",
  facebook: "",
  profile_img_path: "fonoellencaroline_.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "malheiros.equo@gmail.com",
  username: "@malheiros.equo",
  name: "Marcia Cristina",
  lastname: "Malheiros",
  bio: "👩‍⚕️Fisioterapeuta| 👩‍🎓UEPA
  🐴Equoterapeuta Ande Brasil & Clínica TSB.
  💖Transformando vidas a Passos de Confiança!
  📍Amazona.",
  password: "123456",
  profission: "️Fisioterapeuta",
  endereco: "",
  phone: "",
  email_prof: "malheiros.equo@gmail.com",
  instagram: "@malheiros.equo",
  linkedin: "",
  facebook: "",
  profile_img_path: "malheiros.equo.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "psiiris_@gmail.com",
  username: "@psiiris_",
  name: "Íris",
  lastname: "Costa",
  bio: "Mãe da Maria Jhúlia
Mestre em Educação- UNIFAP
Neuropsicopedagoga
Psicopedagoga Esp. em Análise do Comportamento Aplicada (ABA)
Vem pra nave 🚀",
  password: "123456",
  profission: "Psicopedagoga",
  endereco: "",
  phone: "",
  email_prof: "psiiris_@gmail.com",
  instagram: "@psiiris_",
  linkedin: "",
  facebook: "",
  profile_img_path: "psiiris_.png",
},
  :normal
)


Accounts.create_user_roles(%{
  email: "pereira.andreia_@gmail.com",
  username: "@pereira.andreia_",
  name: "Andreia",
  lastname: "Felix",
  bio: "💧Consultora do Bem-Estar DōTERRA
  📘Pós-graduanda em TEA 🧩
  👨‍👩‍👧 Mãe do Gustavo, Estephany e Ana
  ❤️ @instadoitalo",
  password: "123456",
  profission: " ",
  endereco: "",
  phone: "",
  email_prof: "pereira.andreia_@gmail.com",
  instagram: "@pereira.andreia_",
  linkedin: "",
  facebook: "",
  profile_img_path: "pereira.andreia_.png",
},
  :normal
)


