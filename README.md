# Projeto Vagrant + Jenkins

Ambiente DevOps com duas VMs Ubuntu 22.04:

| VM | IP | Responsabilidade |
| --- | --- | --- |
| `jenkins` | `192.168.56.10` | Jenkins, Java 21, Git e Node.js 20 |
| `prod` | `192.168.56.20` | Node.js 20 e aplicacao Express |

## Subir as maquinas

```bash
vagrant up
```

Para acessar uma VM:

```bash
vagrant ssh jenkins
vagrant ssh prod
```

## Enderecos

- Jenkins: `http://192.168.56.10:8080`
- Aplicacao em producao: `http://192.168.56.20:3000/status`

A pasta `app/` e sincronizada automaticamente em `/opt/app` na VM `prod`.
O servico `node-app.service` instala as dependencias de producao e inicia a API.

## Pipeline

Crie no Jenkins um item do tipo **Pipeline**, configure a URL deste repositorio em
**Pipeline script from SCM** e selecione `Jenkinsfile`. A pipeline executa:

1. `npm ci`
2. `npm test`
3. `npm run build`
