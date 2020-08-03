# mirror-repo
github action to mirror repo without paid plan 免費的自動鏡像git倉庫action


## 使用方法
Fork 本專案之後，進行如下設置
### 設置參數
settings -> secrets 添加以下參數

- API_TOKEN_GITHUB: Github Personal Access Token需要有repo讀寫權限
- API_TOKEN_GITHUB: Github Personal Access Token需要有repo讀寫權限
- USERNAME_GITLAB: Gitlab 用戶名

### 設置項目
在gitlab創建相應的`<mirror_repo>`項目，將`./mirror-gitlab.sh`中的項目名稱替換爲您需要鏡像的項目, 當有多個專案時`folder`應使用不同命名。

```bash
repo_source=https://$API_TOKEN_GITHUB@github.com/<source_user>/<source_repo>.git;
repo_mirror=https://$USERNAME_GITLAB:$API_TOKEN_GITLAB@gitlab.com/$USERNAME_GITLAB/<mirror_repo>.git;
folder=<a unique name>;

mirror ${repo_source} ${repo_mirror} ${folder};
```
