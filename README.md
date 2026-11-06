> [!IMPORTANT]
> **此 repo 已不再維護。** 這個 image 已移到 [swaglive/docker-images](https://github.com/swaglive/docker-images/tree/master/docker-elasticsearch)，
> 由 GitHub Actions 推到 `asia-docker.pkg.dev/swag-2c052/swaglive/elasticsearch`，之後的改動請到 docker-images 開 PR。
> 這裡的 publish workflow 已移除，Docker Hub／ghcr.io 上的 `swaglive/elasticsearch` 不會再更新。（GENP-6287）

* Build and push Docker
  * Supports
    * Github Registry
    * Docker Hub (TODO)
    * Google Artifact Registry (TODO)
* Utilizes docker layer caching with Github Container Registry
* Creates Github Release on tag push based on semver

# Getting Started
- [ ] Add `Dockerfile`
- [ ] (Optional) Update Github Actions event conditions
