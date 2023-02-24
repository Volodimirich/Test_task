# Мы итерируемся по всему листу, так как в худшем случае наши значения могут быть на -1 и -2 позиции
# Time complexity - O(n)
# Мы заводим словарь для элементов, количество элементов в словаре зависит от длины списка
# Space complexity - O(n)
from typing import List


def solve(nums: List[int], target: int) -> List[int]:
    val_dict = {}
    for pos, val in enumerate(nums):
        if target - val in val_dict:
            return [val_dict[target - val], pos]
        val_dict[val] = pos
    return [-1]


if __name__ == '__main__':
    assert solve([2, 7, 11, 15], 9) == [0, 1]
    assert solve([3, 2, 4], 6) == [1, 2]
    assert solve([3, 3], 6) == [0, 1]
