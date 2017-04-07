# SimulateHttpRequestData
### 该项目描述了动态模拟请求数据的方式。
## 准备工作
- 1、需要安装抓包工具 Charles(青花瓷)
- 2、因为是模拟项目请求数据方式，所以需要一些第三方库（AFNetwork, MJRefresh）
- 3、搭建项目，设置好模拟请求（下拉刷新获取数据动作）

## 完成上面的准备工作后，进行以下操作步骤
### 1、打开Charles进行设置，如下图
![image](https://github.com/sjxjjx/SimulateHttpRequestData/raw/master/Picture/001.png)

### 2、在Charles中拦截网络请求，并使用本地数据，如下图
![image](https://github.com/sjxjjx/SimulateHttpRequestData/raw/master/Picture/002.png)
![image](https://github.com/sjxjjx/SimulateHttpRequestData/raw/master/Picture/003.png)
![image](https://github.com/sjxjjx/SimulateHttpRequestData/raw/master/Picture/004.png)

### 3、完成后如下图
![image](https://github.com/sjxjjx/SimulateHttpRequestData/raw/master/Picture/005.png)

### 这样我们就能够动态模拟请求数据了，不需要每次都重新运行Xcode，只需要修改本地的json文件即可。
![image](https://github.com/sjxjjx/SimulateHttpRequestData/raw/master/Picture/006.png)
![image](https://github.com/sjxjjx/SimulateHttpRequestData/raw/master/Picture/007.png)
