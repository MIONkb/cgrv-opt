import torch
from torch import nn
from einops import rearrange
# import torchvision

import torch_mlir

import sys


class L(nn.Module):
    def __init__(self, dim = 3):
        super().__init__()
        self.to_out = nn.Linear(dim, dim, bias = False)
    
    def forward(self, x):
        return self.to_out(x)

a = L(3)
img2 = torch.ones(4, 3)
preds = a(img2)

module = torch_mlir.compile(a, img2, output_type="TORCH",use_tracing=True,verbose=True)
print("TORCH OutputType\n", module.operation.get_asm(large_elements_limit=10))

module = torch_mlir.compile(a, img2, output_type="tosa",use_tracing=True,verbose=True)
print("tosa OutputType\n", module.operation.get_asm(large_elements_limit=10))