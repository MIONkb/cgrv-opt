import torch
from torch import nn
from einops import rearrange
# import torchvision

import torch_mlir

import sys


class L(nn.Module):
    def __init__(self, dim = 3):
        super().__init__()
        self.L1 = nn.Linear(dim, dim, bias = False)
    
    def forward(self, x):
        x = self.L1(x)
        return x

a = L(3)
img2 = torch.ones(2, 3)
preds = a(img2)

module = torch_mlir.compile(a, img2, output_type="TORCH",verbose=True)
# 打开文件以供写入
file = open("Linear_TORCH.mlir", "w")
# # 将输出打印到文件
print(module.operation.get_asm(large_elements_limit=10),file = file)
# # 关闭文件
file.close()



module = torch_mlir.compile(a, img2, output_type="tosa",verbose=True)
# 打开文件以供写入
file = open("Linear_TOSA.mlir", "w")
# 将输出打印到文件
print(module.operation.get_asm(large_elements_limit=10),file = file)
# 关闭文件
file.close()