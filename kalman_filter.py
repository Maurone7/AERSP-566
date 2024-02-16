import random
import time
import tracemalloc

def random_values():
    value = random.randint(0, 10000000)
    return value

#define random three values
list_of_random_values = [random_values() for _ in range(100000000)]

def normal_average(list_of_random_values):
    normal_method_average = sum(list_of_random_values) / len(list_of_random_values)
    return normal_method_average


def kalman_filter(values_list):
    average = 0
    for n in range(1, len(list_of_random_values)+1):
        average = (n-1)/n * average + 1/n * values_list[n-1]
        if n == len(list_of_random_values):
            return average

def main():
    tracemalloc.start()
    time_start = time.time()
    print("Normal average {}".format(normal_average(list_of_random_values)))
    print(time.time() - time_start)
    print(tracemalloc.get_traced_memory())
    tracemalloc.stop()
    tracemalloc.start()
    time_start = time.time()
    print("Kalman Filter Average".format(kalman_filter(list_of_random_values)))
    print(time.time() - time_start)
    print(tracemalloc.get_traced_memory())
    tracemalloc.stop()
    print("Done")


if __name__=="__main__":
    main()
