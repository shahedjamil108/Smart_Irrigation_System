
  $regfile = "m8def.dat"
    $crystal = 12000000

 Config Portd = Output
 Config Portb = Output
 Config Portc = Input

     Config Lcd = 16 * 2
      Config Lcdpin = Pin , Rs = Portd.0 , E = Portd.1 , Db4 = Portd.2 , Db5 = Portd.3 , Db6 = Portd.4 , Db7 = Portd.5

     Config Adc = Single , Prescaler = Auto , Reference = Internal,
          Start Adc

    Dim A As Byte
     Dim B As Byte

    Cursor Off
    Cls




 Main:
    Cls
    Locate 1 , 1
        Lcd "SMART IRRIGATION"
        Waitms 100
          Locate 2 , 1
        Lcd "    SYSTEM      "
      Waitms 500
   Do
      A = Getadc(5)
         B = A / 4


    If B < 20 Then
       Gosub Z
         End If

  Loop

 Z:
  Cls
   Locate 1 , 1
        Lcd "WATER NOT FOUND"
        Waitms 500

          Locate 2 , 1
        Lcd "PUMP MOTOR ON"
        Waitms 100
   Portb.1 = 1

 Do
    A = Getadc(5)
         B = A / 4

  If B > 20 Then
   Waitms 150
     Gosub X
       End If
 Loop

X:
 Cls
 Locate 1 , 1
        Lcd "SOIL IS WET "
        Waitms 100

      Locate 2 , 1
        Lcd "PUMP MOTOR OFF"
        Waitms 30
   Portb.1 = 0

Do
    A = Getadc(5)
         B = A / 4

If B > 15 Then
Waitms 50
     Gosub Main
       End If

Loop


