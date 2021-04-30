FROM runatlantis/atlantis:v0.17.0

ARG TERRAGRUNT=v0.29.1
RUN apk --update --no-cache add nodejs npm

ADD https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT}/terragrunt_linux_amd64 /usr/local/bin/terragrunt
RUN chmod +x /usr/local/bin/terragrunt

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["server"]
