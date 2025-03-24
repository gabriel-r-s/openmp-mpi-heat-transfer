import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

np.set_printoptions(precision=3, suppress=True)

serial = pd.read_csv("results/serial.csv", header=None, names=["size", "time"], delimiter=" ")
threads = pd.read_csv("results/threads.csv", header=None, names=["size", "time"], delimiter=" ")
gpu = pd.read_csv("results/gpu.csv", header=None, names=["size", "time"], delimiter=" ")

# somente para testes:
# gpu["time"] /= 2.0

FIG_DPI = 300.0
FIG_SIZE = (10, 4)


serial = serial.groupby("size")["time"].mean()
threads = threads.groupby("size")["time"].mean()
gpu = gpu.groupby("size")["time"].mean()
index = serial.index

def plot_time():
    plt.figure(figsize=FIG_SIZE)
    plt.plot(index, serial.values, label="Serial", color="red", marker="o")
    plt.plot(index, threads.values, label="Threads", color="green", linestyle="--", marker="s")
    plt.plot(index, gpu.values, label="GPU", color="blue", linestyle=":", marker="^")
    plt.legend()
    plt.xticks(index, fontsize=8, rotation=45)
    plt.xlabel("Largura")
    plt.ylabel("Tempo de Execução")

    plt.tight_layout()
    plt.savefig("results/time.png", dpi=FIG_DPI)
    # plt.show()


def plot_time_zoomed():
    plt.figure(figsize=FIG_SIZE)
    plt.plot(index[:3], serial.values[:3], label="Serial", color="red", marker="o")
    plt.plot(index[:3], threads.values[:3], label="Threads", color="green", linestyle="--", marker="s")
    plt.plot(index[:3], gpu.values[:3], label="GPU", color="blue", linestyle=":", marker="^")
    plt.legend()
    plt.xticks(index[:3])
    plt.xlabel("Largura")
    plt.ylabel("Tempo de Execução")

    plt.tight_layout()
    plt.savefig("results/time_zoomed.png", dpi=FIG_DPI)
    # plt.show()


def plot_speedup():
    speedup_serial = np.ones(len(index))
    speedup_threads = serial.values / threads.values
    speedup_gpu = serial.values / gpu.values

    plt.figure(figsize=FIG_SIZE)
    plt.plot(index, speedup_serial, label="Serial", color="red")
    plt.plot(index, speedup_threads, label="Threads", color="Green", linestyle="--", marker="s")
    plt.plot(index, speedup_gpu, label="GPU", color="Blue", linestyle=":", marker="^")
    plt.legend()
    plt.xticks(index, fontsize=8, rotation=45)
    plt.xlabel("Largura")
    plt.ylabel("Speedup")
    # plt.yscale("log")

    plt.tight_layout()
    plt.savefig("results/speedup.png", dpi=FIG_DPI)
    # plt.show()


def plot_efficiency():
    data_threads = pd.read_csv("results/efficiency.csv", header=None, names=["threads", "size", "time"], delimiter=" ")

    efficiency_threads = data_threads.groupby("threads")["time"].mean()
    index = efficiency_threads.index
    efficiency_threads = (serial[300.0] / efficiency_threads.values) / index
    efficiency_serial = np.ones(len(index))

    plt.figure(figsize=FIG_SIZE)
    plt.plot(index, efficiency_serial, label="Serial", color="red")
    plt.plot(index, efficiency_threads, label="Threads", color="Green", linestyle="--", marker="s")
    plt.legend()
    plt.xticks(index, fontsize=8, rotation=45)
    plt.xlabel("Núm. Threads")
    plt.ylabel("Eficiência")
    plt.yscale("log")

    plt.tight_layout()
    plt.savefig("results/efficiency.png", dpi=FIG_DPI)
    # plt.show()


plot_time()
plot_time_zoomed()
plot_speedup()
plot_efficiency()

