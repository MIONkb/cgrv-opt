# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
# Also available under a BSD-style license. See LICENSE.

import torch
import torchvision
from torchvision import models

import torch_mlir

resnet18 = torchvision.models.resnet18(weights=models.ResNet18_Weights.IMAGENET1K_V1)
resnet18.eval()
print(resnet18)

# 打开文件以供写入
file = open("TORCH.mlir", "w")
# # 将输出打印到文件
module = torch_mlir.compile(resnet18, torch.ones(1, 3, 224, 224), output_type="torch")
print(module.operation.get_asm(), file=file)
# # 关闭文件
file.close()

# 打开文件以供写入
file = open("TOSA_test.mlir", "w")
module = torch_mlir.compile(resnet18, torch.ones(1, 3, 224, 224), output_type="tosa")
print(module.operation.get_asm(large_elements_limit=10), file=file)
# # 关闭文件
file.close()

# 打开文件以供写入
file = open("LINALG_TENSOR.mlir", "w")
module = torch_mlir.compile(resnet18, torch.ones(1, 3, 224, 224), output_type="linalg-on-tensors")
# print(module.operation.get_asm(large_elements_limit=10), file=file)
print(module.operation.get_asm(), file=file)
# # 关闭文件
file.close()

# module = torch_mlir.compile(resnet18, torch.ones(1, 3, 224, 224), output_type="RAW")
# print("LINALG_ON_TENSORS OutputType\n", module.operation.get_asm(large_elements_limit=10))
# TODO: Debug why this is so slow.

