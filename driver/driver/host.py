import sys
import getopt
import string
import serial as SE
import time

def help_message():
    print '''
options:
-h                  display this help
-p n                set COMn as default port
-i filename         write file to instruction memory
-d filename         write file to data memory
-r filename         read data memory and write to file
-c command          execute single command

command format:
i addr data         0x00 < addr < 0xFF, 0x00000000 < data < 0xFFFFFFFF
d addr data         0x00 < addr < 0xFF, 0x00000000 < data < 0xFFFFFFFF
r addr              0x00 < addr < 0xFF - read data memory address
s                   enable / disable processor
f funct inpA inpB   0x00000000 < funct, inpA, inpB < 0xFFFFFFFF'''
    sys.exit(0)

COM = '\\.\COM5'

try:
    options, xarguments = getopt.getopt(sys.argv[1:],'hp:c:i:d:r:')
except getopt.error:
    print 'Error: You tried to use an unknown option or the argument for an option that requires it was missing. Try -h for more information.'
    sys.exit(0)

    
""" help message """
for a in options[:]:
    if a[0] == '-h':
        help_message()
        sys.exit(0)

        
""" set COM port, COM5 otherwise """
for a in options[:]:
    if a[0] == '-p' and a[1] != '':
        COM = '\\.\COM' + a[1]
        options.remove(a)
        break
    elif a[0] == '-p' and a[1] == '':
        print '-p expects an argument'
        sys.exit(0)

        
""" execute single command (i,d,r,s) """
for a in options[:]:
    if a[0] == '-c' and a[1] != '':
        try:
            ser = SE.Serial(port=COM, baudrate=115200, bytesize=SE.EIGHTBITS, parity=SE.PARITY_NONE, stopbits=SE.STOPBITS_ONE, timeout=1)
        except SE.SerialException:
            print 'COM port unknown'
            sys.exit(0)
            
        if ser.isOpen():
            print 'port opened'

            s = ''
            if a[1] == 'i':

                if int(xarguments[0],16) == 0:
                    s = 'i' + chr(255) + chr(254)
                elif int(xarguments[0],16) == 255:
                    s = 'i' + chr(255) + chr(255)
                else:
                    s = 'i' + chr(int(xarguments[0],16))

                data = str(hex(int(xarguments[1],16) | 0x100000000))
                data = data.replace('0x1','')
                data = data.replace('L','')
                d1 = int(data[0:2],16)
                d2 = int(data[2:4],16)
                d3 = int(data[4:6],16)
                d4 = int(data[6:8],16)

                if d1 == 0:
                    s = s + chr(255) + chr(254)
                elif d1 == 255:
                    s = s + chr(255) + chr(255)
                else:
                    s = s + chr(d1)

                if d2 == 0:
                    s = s + chr(255) + chr(254)
                elif d2 == 255:
                    s = s + chr(255) + chr(255)
                else:
                    s = s + chr(d2)

                if d3 == 0:
                    s = s + chr(255) + chr(254)
                elif d3 == 255:
                    s = s + chr(255) + chr(255)
                else:
                    s = s + chr(d3)

                if d4 == 0:
                    s = s + chr(255) + chr(254)
                elif d4 == 255:
                    s = s + chr(255) + chr(255)
                else:
                    s = s + chr(d4)

            elif a[1] == 'd':

                if int(xarguments[0],16) == 0:
                    s = 'd' + chr(255) + chr(254)
                elif int(xarguments[0],16) == 255:
                    s = 'd' + chr(255) + chr(255)
                else:
                    s = 'd' + chr(int(xarguments[0],16))

                data = str(hex(int(xarguments[1],16) | 0x100000000))
                data = data.replace('0x1','')
                data = data.replace('L','')
                d1 = int(data[0:2],16)
                d2 = int(data[2:4],16)
                d3 = int(data[4:6],16)
                d4 = int(data[6:8],16)

                if d1 == 0:
                    s = s + chr(255) + chr(254)
                elif d1 == 255:
                    s = s + chr(255) + chr(255)
                else:
                    s = s + chr(d1)

                if d2 == 0:
                    s = s + chr(255) + chr(254)
                elif d2 == 255:
                    s = s + chr(255) + chr(255)
                else:
                    s = s + chr(d2)

                if d3 == 0:
                    s = s + chr(255) + chr(254)
                elif d3 == 255:
                    s = s + chr(255) + chr(255)
                else:
                    s = s + chr(d3)

                if d4 == 0:
                    s = s + chr(255) + chr(254)
                elif d4 == 255:
                    s = s + chr(255) + chr(255)
                else:
                    s = s + chr(d4)

            elif a[1] == 'r':
                if int(xarguments[0],16) == 0:
                    s = 'r' + chr(255) + chr(254)
                elif int(xarguments[0],16) == 255:
                    s = 'r' + chr(255) + chr(255)
                else:
                    s = 'r' + chr(int(xarguments[0],16))

            elif a[1] == 's':
                s = 's'
                ser.write(s)
                ser.flush()
                i1 = ser.readline()
                i1 = i1.rstrip()
                print i1
                ser.close()
                print 'port closed'
                sys.exit(0)

            elif a[1] == 'f':

                for x in xarguments[:]:
                    
                    data = str(hex(int(x,16) | 0x100000000))
                    data = data.replace('0x1','')
                    data = data.replace('L','')
                    d1 = int(data[0:2],16)
                    d2 = int(data[2:4],16)
                    d3 = int(data[4:6],16)
                    d4 = int(data[6:8],16)

                    if d1 == 0:
                        s = s + chr(255) + chr(254)
                    elif d1 == 255:
                        s = s + chr(255) + chr(255)
                    else:
                        s = s + chr(d1)

                    if d2 == 0:
                        s = s + chr(255) + chr(254)
                    elif d2 == 255:
                        s = s + chr(255) + chr(255)
                    else:
                        s = s + chr(d2)

                    if d3 == 0:
                        s = s + chr(255) + chr(254)
                    elif d3 == 255:
                        s = s + chr(255) + chr(255)
                    else:
                        s = s + chr(d3)

                    if d4 == 0:
                        s = s + chr(255) + chr(254)
                    elif d4 == 255:
                        s = s + chr(255) + chr(255)
                    else:
                        s = s + chr(d4)
                        
                    ser.flush()
                    time.sleep(0.1)
                    ser.write(s)
                    s = ''

                i1 = ser.readline()
                i1 = i1.rstrip()
                print i1
                
                time.sleep(0.1)
                i1 = ser.readline()
                i1 = i1.rstrip()
                print i1

                ser.close()
                print 'port closed'
                sys.exit(0)
                
            else:
                ser.close()
                print 'wrong command format, port closed'
                sys.exit(0)

            ser.write(s)
            time.sleep(0.1)
            ser.flush()
            i1 = ser.readline()
            i1 = i1.rstrip()
            print i1
            
            ser.close()
            print 'port closed'
            sys.exit(0)
        else:
            print 'error opening port'
            sys.exit(0)
    elif a[0] == '-c' and a[1] == '':
        print '-c expects an argument'
        sys.exit(0)

        
""" read data memory and write to file """
for a in options[:]:
    if a[0] == '-r' and a[1] != '':
        try:
            ser = SE.Serial(port=COM, baudrate=115200, bytesize=SE.EIGHTBITS, parity=SE.PARITY_NONE, stopbits=SE.STOPBITS_ONE, timeout=1)
        except SE.SerialException:
            print 'COM port unknown'
            sys.exit(0)
        if ser.isOpen():
            print 'port opened'
            f = open(a[1], 'w')
            print 'writing file'
            
            """ 0x00 corresponds to 0xFFFE """
            ser.write('r'+ chr(255) + chr(254))
            time.sleep(0.1)
            ser.flush()
            i1 = ser.readline()
            i1 = i1.rstrip()
            i2 = hex(int(i1.split(' ')[5]))
            i3 = hex(int(i1.split(' ')[2]) & 0xFFFFFFFF)
            f.write(i2 + ' ' + i3.replace('L','') + '\n')
            ser.flushInput()
            ser.flushOutput()

            """ cycle from 0x01 to 0xFE """
            for i in xrange(1, 255):
                ser.write('r'+ chr(i))
                time.sleep(0.1)
                ser.flush()
                i1 = ser.readline()
                i1 = i1.rstrip()
                i2 = hex(int(i1.split(' ')[5]))
                i3 = hex(int(i1.split(' ')[2]) & 0xFFFFFFFF)
                f.write(i2 + ' ' + i3.replace('L','') + '\n')
                ser.flushInput()
                ser.flushOutput()

            """ 0xFF corresponds to 0xFFFF """
            ser.write('r'+ chr(255) + chr(255))
            time.sleep(0.1)
            ser.flush()
            i1 = ser.readline()
            i1 = i1.rstrip()
            i2 = hex(int(i1.split(' ')[5]))
            i3 = hex(int(i1.split(' ')[2]) & 0xFFFFFFFF)
            f.write(i2 + ' ' + i3.replace('L','') + '\n')
            ser.flushInput()
            ser.flushOutput()

            ser.close()
            f.close()
            print 'port closed'
            sys.exit(0)
        else:
            print 'error opening port'
            sys.exit(0)
    elif a[0] == '-r' and a[1] == '':
        print '-r expects an argument'
        sys.exit(0)




""" write file to instruction memory """
for a in options[:]:
    if a[0] == '-i' and a[1] != '':
        try:
            ser = SE.Serial(port=COM, baudrate=115200, bytesize=SE.EIGHTBITS, parity=SE.PARITY_NONE, stopbits=SE.STOPBITS_ONE, timeout=1)
        except SE.SerialException:
            print 'COM port unknown'
            sys.exit(0)
        if ser.isOpen():
            print 'port opened'

            f = open(a[1], 'r')
            print 'writing instruction memory'
            for line in f:
                i1 = line.rstrip()
                i1 = i1.split(' ')
                i1[0] = int(i1[0],16)
                data = str(hex(int(i1[1],16) | 0x100000000))
                data = data.replace('0x1','')
                data = data.replace('L','')
                d1 = int(data[0:2],16)
                d2 = int(data[2:4],16)
                d3 = int(data[4:6],16)
                d4 = int(data[6:8],16)
                s = 'i'

                if i1[0] == 0:
                    s = s + chr(255) + chr(254)
                elif i1[0] == 255:
                    s = s + chr(255) + chr(255)
                else:
                    s = s + chr(i1[0])
                
                if d1 == 0:
                    s = s + chr(255) + chr(254)
                elif d1 == 255:
                    s = s + chr(255) + chr(255)
                else:
                    s = s + chr(d1)

                if d2 == 0:
                    s = s + chr(255) + chr(254)
                elif d2 == 255:
                    s = s + chr(255) + chr(255)
                else:
                    s = s + chr(d2)

                if d3 == 0:
                    s = s + chr(255) + chr(254)
                elif d3 == 255:
                    s = s + chr(255) + chr(255)
                else:
                    s = s + chr(d3)

                if d4 == 0:
                    s = s + chr(255) + chr(254)
                elif d4 == 255:
                    s = s + chr(255) + chr(255)
                else:
                    s = s + chr(d4)

                ser.write(s)
                time.sleep(0.1)
                ser.flush()
                inp = ser.readline()
                inp = inp.rstrip()
                print inp
                ser.flushInput()
                ser.flushOutput()

            f.close()

            ser.close()
            print 'port closed'
            sys.exit(0)
        else:
            print 'error opening port'
            sys.exit(0)
    elif a[0] == '-i' and a[1] == '':
        print '-i expects an argument'
        sys.exit(0)




""" write file to data memory """
for a in options[:]:
    if a[0] == '-d' and a[1] != '':
        try:
            ser = SE.Serial(port=COM, baudrate=115200, bytesize=SE.EIGHTBITS, parity=SE.PARITY_NONE, stopbits=SE.STOPBITS_ONE, timeout=1)
        except SE.SerialException:
            print 'COM port unknown'
            sys.exit(0)
        if ser.isOpen():
            print 'port opened'

            f = open(a[1], 'r')
            print 'writing data memory'
            for line in f:
                i1 = line.rstrip()
                i1 = i1.split(' ')
                i1[0] = int(i1[0],16)
                data = str(hex(int(i1[1],16) | 0x100000000))
                data = data.replace('0x1','')
                data = data.replace('L','')
                d1 = int(data[0:2],16)
                d2 = int(data[2:4],16)
                d3 = int(data[4:6],16)
                d4 = int(data[6:8],16)
                s = 'd'

                if i1[0] == 0:
                    s = s + chr(255) + chr(254)
                elif i1[0] == 255:
                    s = s + chr(255) + chr(255)
                else:
                    s = s + chr(i1[0])
                
                if d1 == 0:
                    s = s + chr(255) + chr(254)
                elif d1 == 255:
                    s = s + chr(255) + chr(255)
                else:
                    s = s + chr(d1)

                if d2 == 0:
                    s = s + chr(255) + chr(254)
                elif d2 == 255:
                    s = s + chr(255) + chr(255)
                else:
                    s = s + chr(d2)

                if d3 == 0:
                    s = s + chr(255) + chr(254)
                elif d3 == 255:
                    s = s + chr(255) + chr(255)
                else:
                    s = s + chr(d3)

                if d4 == 0:
                    s = s + chr(255) + chr(254)
                elif d4 == 255:
                    s = s + chr(255) + chr(255)
                else:
                    s = s + chr(d4)

                ser.write(s)
                time.sleep(0.1)
                ser.flush()
                inp = ser.readline()
                inp = inp.rstrip()
                print inp
                ser.flushInput()
                ser.flushOutput()

            f.close()

            ser.close()
            print 'port closed'
            sys.exit(0)
        else:
            print 'error opening port'
            sys.exit(0)
    elif a[0] == '-d' and a[1] == '':
        print '-d expects an argument'
        sys.exit(0)



