## 🧩 Arquitetura
```plaintext
lib/
├── main.dart               # main app
├── core/                   # Código compartilhado e configurações gerais
│   ├── constants/          # Constantes (cores, strings, etc)
│   ├── utils/              # Funções utilitárias
|   ├── colors/             # Cores das telas que não seguem tema.
│   └── theme/              # Temas e estilos
│
├── data/                   # Camada de dados
│   ├── database/           # Banco de dados local
│   ├── repositories/       # Interface de comunicação com banco de dados
│   └── models/             # Modelos de dados local
│
├── server/                 # Camada de comunicação com servidor
│   ├── services/           # Entidades de servicos (comunicação com api)
│   ├── repositories/       # Interface de comunicação com a api 
│   ├── models/             # Entidades de dados da requisição  
│   ├── https/              # Interface de comunicação http
│   ├── uris/               # Entidades de build do schema http
│   └── bodys/              # Entidades de corpos de requisição
│
├── presentation/           # UI e gerenciamento de estado
│   ├── blocs/              # BLoCs ou Cubits
│   ├── providers/          # Providers para gerenciamento de estado
│   ├── screens/            # Telas (pages)
│   ├── widgets/            # Widgets reutilizáveis
│   └── routes/             # Gerenciamento de rotas
```

