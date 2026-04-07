# depill - Simple Git Deploy Template

This repo lets you push code to a remote Linux machine and automatically build + run it.

No CI. No Docker. Just Git and a small hook.

---

## How it works

git push → remote repo updates → hook runs → build + execute

---

## Requirements

On the server:
- Linux
- git
- compiler

On your local machine:
- Git + SSH access to the server

---

## Setup (on the server)

Clone the repo:

```bash
git clone https://github.com/dadij/depill.git myproj
cd myproj
```

Modify compile command in setup.sh (defaults to g++, output should be named main)

Run setup:

```bash
./setup.sh
```

This will:
- allow pushing into the working tree
- install the Git hook

---

## Add remote (on your local machine)

```bash
git remote add server user@host:myproj
```
---

## Deploy

Push your code:

git push server main

That’s it.

The server will:
1. receive the push
2. update files
3. run redeploy script 

---

## Long-running programs

If your program runs continuously, this should:

# stop previous instance
if [[ -f main.pid ]]; then
    kill "$(cat main.pid)" 2>/dev/null || true
    rm -f main.pid
fi

# build
g++ -std=c++20 -O2 main.cpp -o main

# run in background
nohup ./main > app.log 2>&1 &
echo $! > main.pid

---

## Logs

View output:

```bash
tail -f app.log
```

---

## Notes

- Hook is not tracked by Git → installed via setup.sh
- This is a simple deployment system, not production-grade
- Don’t run this on anything critical unless you understand it

---

## TL;DR

git push server main

→ your code builds and runs on the server
