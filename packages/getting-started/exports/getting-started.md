## Shared prayers

This project uses [pray](https://github.com/kiskolabs/pray) to install and lock shared inference input from the amkisko prayers distribution.

Install the CLI:

```sh
cargo install --git https://github.com/kiskolabs/pray --locked pray
```

Initialize or update managed input:

```sh
pray install
pray plan
pray apply
pray verify
```

Declare dependencies in `Prayfile`. Do not edit managed spans in `AGENTS.md` or `.agents/skills/`.

To refresh shared guidance after publishers release new versions:

```sh
pray update
pray plan
pray apply
```

Distribution source for amkisko-wide packages: [amkisko/prayers](https://github.com/amkisko/prayers).
