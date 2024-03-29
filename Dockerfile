#
# MIT License
#
# (C) Copyright [2022] Hewlett Packard Enterprise Development LP
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#

FROM artifactory.algol60.net/csm-docker/stable/docker.io/library/golang:1.17.3-alpine3.15

ARG VERSION=v0.2.0

RUN mkdir -p /grafterm

RUN apk --no-cache add \
    g++ \
    git \
    bash \
    wget

WORKDIR /grafterm

RUN wget "https://github.com/slok/grafterm/releases/download/$VERSION/grafterm-linux-amd64"

RUN mv grafterm-linux-amd64 /usr/bin/grafterm

RUN chmod 755 /usr/bin/grafterm

RUN chmod u+s /bin/ping

USER 65534:65534

CMD [ "ping", "cray-sysmgmt-health-kube-p-prometheus" ]
