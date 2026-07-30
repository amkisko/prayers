## Shared prayers

This project uses [pray](https://github.com/kiskolabs/pray) to install and lock shared inference input from the amkisko prayers distribution.

Install the CLI:

```sh
cargo install --git https://github.com/kiskolabs/pray --locked pray
```

Declare destinations with `compose`, `tree`, and `pray …, file:`:

```prayfile
prayfile "1"
source "amkisko", git: "https://github.com/amkisko/prayers.git"

compose "AGENTS.md" do
  pray ".agents/project.md"
  pray "amkisko/working-rules", "~> 2.0"
end

tree ".agents/skills" do
  pray "amkisko/engineering-audit", "~> 2.0"
end

pray "amkisko/community-security", "~> 1.1", file: "SECURITY.md"
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
