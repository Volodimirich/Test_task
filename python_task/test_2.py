# Мы работаем с отсортированным массивом и ищем первую позицию 1. Это бинарный поиск
# В общем случае время работы также зависит от сложности isBrokenVersion, мы будем иметь O(logn) * O(isBrokenVersion)
# Time complexity - O(logn) (если вызов isBrokenVersion работает константное время)
# Мы используем лишь переменные, их количество не зависит от входных параметров
# Space complexity - O(1)
def isBrokenVersion(version: int) -> bool:
    global data
    return bool(data[version])


def solve(n) -> int:
    l, r = 0, n - 1
    while l < r:
        mid = (l + r) // 2
        if isBrokenVersion(mid):
            l, r = l, mid
        else:
            l, r = mid + 1, r
    return l


if __name__ == '__main__':
    data = [0, 1]
    assert solve(len(data)) == 1

    data = [1, 1]
    assert solve(len(data)) == 0

    data = [1]
    assert solve(len(data)) == 0

    data = [0, 0, 0, 1]
    assert solve(len(data)) == 3

    data = [0, 0, 0, 0, 0, 0, 0, 1]
    assert solve(len(data)) == 7

    data = [0, 0, 0, 0, 0, 0, 1, 1]
    assert solve(len(data)) == 6





