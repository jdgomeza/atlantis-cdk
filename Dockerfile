FROM runatlantis/atlantis:v0.18.2

ARG TERRAGRUNT=v0.35.16

ADD https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT}/terragrunt_linux_amd64 /usr/local/bin/terragrunt

RUN apk --update --no-cache add nodejs npm curl openssl bash \
&& npm install -g npm \
&& chmod +x /usr/local/bin/terragrunt \
&& curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
&& chmod 700 get_helm.sh \
&& ./get_helm.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["server"]
