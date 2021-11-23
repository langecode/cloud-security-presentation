# Cluster Security

## Runtime Cluster Security

Start and explore Falco and Falco sidekick.

```bash
helm repo add falcosecurity https://falcosecurity.github.io/charts
helm repo update

helm install falco falcosecurity/falco --set falcosidekick.enabled=true --set falcosidekick.webui.enabled=true

# Run in a terminal in a container on the machine.
# This emulates a crypto miner using the stratum protocol
wget stratum+tcp://evil-crypto-miners.com
```
