from multiprocessing import Process, Queue, cpu_count
from os import remove

def slave(number, qIn, qOut):
    name = f"slave-{number}.csv"
    with open(name, "w") as file:
        pass
    with open(name, "r+") as file:
        while True:
            if not qIn.empty():
                get = qIn.get()
                if get == False:
                    qOut.put(name)
                    break
                else:
                    write = True
                    file.seek(0)                    
                    for line in file:
                        if set(line.strip("\n").split(",")) == get[1]:
                            write = False
                            break
                    if write:
                        file.write(get[0])

def master():
    qIn = Queue(1)
    qOut = Queue()
    slaves = cpu_count()
    slavesList = []

    for n in range(slaves):
        slavesList.append(Process(target=slave, daemon=True, args=(n, qIn, qOut)))
    for s in slavesList:
        s.start()

    with open("wtf.csv", "r") as file:
        for line in file:
            lineSet = set(line.strip("\n").split(","))
            qIn.put((line, lineSet))
        for _ in range(slaves):
            qIn.put(False)

    for s in slavesList:
        s.join()

    slavesList = []

    with open(qOut.get(), "r+") as fileMaster:
        for x in range(slaves-1):
            file = qOut.get()
            with open(file, "r") as fileSlave:
                for lineSlave in fileSlave:
                    lineSet = set(lineSlave.strip("\n").split(","))
                    write = True
                    fileMaster.seek(0)
                    for lineMaster in fileMaster:
                        if set(lineMaster.strip("\n").split(",")) == lineSet:
                            write = False
                            break
                    if write:
                        fileMaster.write(lineSlave)

            slavesList.append(Process(target=remove, daemon=True, args=(file,)))
            slavesList[-1].start()

    for s in slavesList:
        s.join()