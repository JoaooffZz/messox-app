## 🧩 Arquitetura
```plaintext
lib/
├── main.dart                 # Ponto de entrada do app
│
├── core/                     # Código compartilhado e configs globais
│   ├── constants/            # Constantes (box names, svgs, lotties, etc.)
│   ├── language/             # Construtor/mapeamento de textos do app
│   ├── colors/               # Definição de cores (fixas e dinâmicas)
│   ├── texts/                # Modelos de textos do app
│   └── theme/                # Temas do app
│
├── data/                     # Camada de dados (local)
│   ├── services/             # Serviços de comunicação com DB local
│   └── models/               # Modelos de dados locais
│
├── server/                   # Camada de comunicação com servidor
│   ├── api/                  # Caixa de ferramentas de requisições HTTP
│   │   ├── https/            # Cliente HTTP
│   │   ├── uris/             # Builders de URIs/endpoints
│   │   ├── headers/          # Builders de headers
│   │   └── bodys/            # Builders de request bodies
│   ├── services/             # Serviços externos (API)
│   ├── repositories/         # Repositórios (interface p/ API)
│   ├── models/               # Modelos de dados da API
│   └── errors/               # Tratamento de erros do servidor
│
├── presentation/             # UI + gerenciamento de estado
│   ├── blocs/                # Gerenciamento de estado com BLoC/Cubit
│   ├── providers/            # Providers (alternativa ou suporte ao BLoC)
│   ├── screens/              # Telas (pages do app)
│   ├── components/           # Componentes reutilizáveis
│   └── routes/               # Configuração e gerenciamento de rotas
```

