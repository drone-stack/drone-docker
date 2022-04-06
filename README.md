# docker builder插件

> 基于官方插件魔改

## 参数

```yaml
  - name: 构建开发镜像
    image: ysicing/drone-plugin-builder
    volumes:
      - name: dockersock
        path: /var/run
    pull: always
    privileged: true
    settings:
      registry: ccr.ccs.tencentyun.com
      repo: ccr.ccs.tencentyun.com/ysicing/drone-plugin-builder
      debug: true
      mode: dev
      tags: develop
      purge: false
      no_cache: false
      dockerfile: Dockerfile
    when:
      branch:
        - develop

services:
  - name: docker daemon
    image: ysicing/drone-plugin-dockerd
    privileged: true
    volumes:
      - name: dockersock
        path: /var/run

volumes:
  - name: dockersock
    temp: {}
```