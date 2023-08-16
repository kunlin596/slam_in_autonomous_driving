# 第一章习题

## 1. 分别用左右扰动模型，计算$\frac{\partial R^{-1}p}{\partial R}$.

首先进行一些必要的引理推导：

$$
\begin{aligned}
R &= \mathrm{exp}(\phi^{\wedge}) \\
\Rightarrow \phi^{\wedge} &= \mathrm{log}(R)\\
R^{-1}
    &= \mathrm{exp}(\phi'^{\wedge}) \\
\Rightarrow \phi'^{\wedge}
    &= \mathrm{log}(R^{-1}) \\
    &=-\mathrm{log}(R) \\
    &=-\phi^{\wedge} \\
\Rightarrow \phi'
    &= -\phi \\
\Rightarrow R^{-1} &= \mathrm{exp}(-\phi^{\wedge}) \\
\end{aligned}
$$

### 左扰动模型

设旋转小量为$\theta$，则其求导可得：

$$
\begin{aligned}
\frac{\partial R^{-1}p}{\partial \theta}
    &= \lim\limits_{\theta\to 0}
        \frac
            {\mathrm{exp(\theta^{\wedge})}\mathrm{exp(-\phi^{\wedge})}p - \mathrm{exp(-\phi^{\wedge})}p}
            {\theta} \\
    &\approx \lim\limits_{\theta\to 0}
        \frac
            {(I+\theta^{\wedge})\mathrm{exp(-\phi^{\wedge})}p - \mathrm{exp(-\phi^{\wedge})}p}
            {\theta}
        && \text{Using 1st order Taylor expansion approximation} \\
    &= \lim\limits_{\theta\to 0}
        \frac
            {\theta^{\wedge}\mathrm{exp(-\phi^{\wedge})}p}
            {\theta} \\
    &= \lim\limits_{\theta\to 0}
        \frac
            {\theta^{\wedge}R^{-1}p}
            {\theta} \\
    &= \lim\limits_{\theta\to 0}
        \frac
            {-(R^{-1}p)^{\wedge}\theta}
            {\theta} \\
    &= -(R^{-1}p)^{\wedge}
\end{aligned}
$$

### 右扰动模型

设旋转小量为$\theta$，则其求导可得：

$$
\begin{aligned}
\frac{\partial R^{-1}p}{\partial \theta}
    &= \lim\limits_{\theta\to 0}
        \frac
            {\mathrm{exp(-\phi^{\wedge})}\mathrm{exp(\theta^{\wedge})}p - \mathrm{exp(-\phi^{\wedge})}p}
            {\theta} \\
    &\approx \lim\limits_{\theta\to 0}
        \frac
            {\mathrm{exp(-\phi^{\wedge})}(I+\theta^{\wedge})p - \mathrm{exp(-\phi^{\wedge})}p}
            {\theta}
        && \text{Using 1st order Taylor expansion approximation} \\
    &= \lim\limits_{\theta\to 0}
        \frac
            {\mathrm{exp(-\phi^{\wedge})}\theta^{\wedge}p}
            {\theta} \\
    &= \lim\limits_{\theta\to 0}
        \frac
            {-R^{-1}p^{\wedge}\theta}
            {\theta} \\
    &= -R^{-1}p^{\wedge}
\end{aligned}
$$

## 2. 分别用左右扰动模型，计算$\frac{\partial R_1R_2^{-1}}{\partial R_2}$.

### 左扰动模型

设旋转小量为$\theta$，则其求导可得：

$$
\begin{aligned}
\frac{\partial \mathrm{Log}(R_1R_2^{-1})}{\partial R_2}
    &= \lim\limits_{\theta\to 0}
        \frac
            {\mathrm{Log}(R_1\mathrm{Exp}(\theta)R_2^{-1})-\mathrm{Log}(R_1R_2^{-1})}
            {\theta} \\

    &= \lim\limits_{\theta\to 0}
        \frac
            {\mathrm{Log}(R_1R_2^{-1}R_2\mathrm{Exp}(\theta)R_2^{-1})-\mathrm{Log}(R_1R_2^{-1})}
            {\theta}
        && \text{Using adjoint map} \\
    &= \lim\limits_{\theta\to 0}
        \frac
            {\mathrm{Log}(R_1R_2^{-1}\mathrm{Exp}({R_2\theta}))-\mathrm{Log}(R_1R_2^{-1})}
            {\theta} \\
    &= \lim\limits_{\theta\to 0}
        \frac
            {\mathrm{Log}(R_1R_2^{-1})+J_r^{-1}(\mathrm{Log}(R_1R_2^{-1}))\mathrm{Log}(\mathrm{Exp(R_2\theta)})-\mathrm{Log}(R_1R_2^{-1})}
            {\theta}
        && \text{Using BCH approximation} \\
    &= J_r^{-1}(\mathrm{Log}(R_1R_2^{-1}))R_2
\end{aligned}
$$

### 右扰动模型

设旋转小量为$\theta$，则其求导可得：

$$
\begin{aligned}
\frac{\partial \mathrm{Log}(R_1R_2^{-1})}{\partial R_2}
    &= \lim\limits_{\theta\to 0}
        \frac
            {\mathrm{Log}(R_1R_2^{-1}\mathrm{Exp}(\theta))-\mathrm{Log}(R_1R_2^{-1})}
            {\theta} \\
    &= \lim\limits_{\theta\to 0}
        \frac
            {\mathrm{Log}(R_1R_2^{-1})+J_r^{-1}(\mathrm{Log}(R_1R_2^{-1}))\theta-\mathrm{Log}(R_1R_2^{-1})}
            {\theta}
        && \text{Using BCH approximation} \\
    &= J_r^{-1}(\mathrm{Log}(R_1R_2^{-1}))
\end{aligned}
$$

## 3. 将实践环节中的运动学修改成带一定角速度的平抛运动。车辆受固定的$Z$轴角速度影响，具有一定的初始水平速度，同时受$-Z$方向的重力加速度影响。请修改程序，给出动画演示。

代码位于[此处](https://github.com/kunlin596/slam_in_autonomous_driving/commit/94c7c97492d4d68331b6ec1dd58b313b7d00a28a)，[video](./homework1_motion.m4v).

## 4. 自行寻找相关材料，说明高斯牛顿法和 Levenberg-Marquardt 法在处理非线性迭代时的差异。

高斯牛顿法和 LM 法都是用于求解非线性最小二乘问题的方法，其区别在于 LM 法在高斯牛顿法的基础上加入了一个阻尼系数，用于控制迭代过程中的步长，从而使得 LM 法具有更好的收敛性。在每一次的迭代之后，通过计算更新新区域的半径（阻尼系数），使得 LM 在梯度下降和牛顿法之间自动选择（使用一次或者二次函数拟合），从而使得 LM 法具有更好的收敛性。
