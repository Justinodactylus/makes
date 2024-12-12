## secureKubernetesWithRbacPolice

???+ warning

    This function is only available on Linux at the moment.

Secure Kubernetes clusters
with [rbac-police](https://github.com/PaloAltoNetworks/rbac-police).

Types:

- secureKubernetesWithRbacPolice (`attrsOf kubernetesWithRbacPolice`): Optional.
    Defaults to `{ }`.
- kubernetesWithRbacPolice (`submodule`):
    - severity (`str`):
        Only evaluate policies with severity >= threshold.
        Defaults to `Low`.
    - setup (`listOf package`):
        [Makes Environment](./environment.md)
        or [Makes Secrets](./secrets.md)
        to `source` (as in Bash's `source`)
        before anything else.
        Defaults to `[ ]`.

Example:

=== "makes.nix"

    ```nix
    {
      outputs,
      secretsForAwsFromGitlab,
      secretsForKubernetesConfigFromAws,
      secureKubernetesWithRbacPolice,
      ...
    }: {
      secretsForAwsFromGitlab = {
        makesProd = {
          roleArn = "arn:aws:iam::123456789012:role/prod";
          duration = 7200;
          retries = 30;
        };
      };
      secretsForKubernetesConfigFromAws = {
        makes = {
          cluster = "makes-k8s";
          region = "us-east-1";
        };
      };
      secureKubernetesWithRbacPolice = {
        makes = {
          severity = "Low";
          setup = [
            outputs."/secretsForAwsFromGitlab/makesProd"
            outputs."/secretsForKubernetesConfigFromAws/makes"
          ];
        };
      };
    }
    ```

=== "Invocation"

    ```bash
    m . /secureKubernetesWithRbacPolice/makes
    ```
