# SSH Server for Kubernetes
Use SSH to connect to your kubernetes cluster. See [blog post](http://ruediste.github.io/cloud/2017/03/13/connect-google-cloud-ssh.html) for details.

## Usage

1. Add your public key to authorized_keys
2. Generate host keys: `./generateHostKeys.sh`
3. Create Kubernetes secret for ssh: `kubectl create secret generic ssh-dir --from-file=./authorized_keys`
4. Create Kubernetes secret for host keys: `kubectl create secret generic ssh-host-keys --from-file=hostKeys`
5. Update values in `./helm-charts/sshd/values.yaml` to fit your use case
6. If you want a fixed public IP, set value `.service.externalIP` or `.service.clusterIP`
7. Install the helm chart: `helm upgrade --install sshd ./helm-charts/sshd`

Whenever you made change to the template:

`helm upgrade --install sshd ./helm-charts/sshd`

Whenever you want to add/remove authorized keys

1. Edit authorized_keys
2. Delete ssh dir secret with `kubectl delete secret ssh-dir`
3. Re-run `kubectl create secret generic ssh-dir --from-file=./authorized_keys`

To uninstall:

`helm uninstall sshd`
