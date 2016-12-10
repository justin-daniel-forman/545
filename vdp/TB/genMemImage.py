from PIL import Image
import numpy as np

def normalize(oldImage, newImage):

  im1 = Image.open(oldImage)

  i = 0 # indexing
  pixelList = im1.tobytes()
  newPixelList = ""
  # print(len(pixelList))
  for pixel in pixelList:
    # print(pixelList[i])
    a = chr(ord(pixelList[i][0]) / 64 * 64) 
    newPixelList += a
    i = i + 1;

  im2 = Image.frombytes("RGB", (512,384), newPixelList)
  im2.save(newImage)

def makeSquare(f, g):
  f.write("memory_initialization_radix=2;\nmemory_initialization_vector=\n")
  # Character Patterns
  colors = {}
  colors["00000000"] = "0000"
  colors["00001101"] = "0001"
  colors["00001110"] = "0010"
  colors["00001111"] = "0011" 
  colors["00001001"] = "0100"
  colors["00001011"] = "0101"
  colors["00000101"] = "0110"
  colors["00000110"] = "0111"
  colors["00000111"] = "1000"
  colors["00111111"] = "1001"
  populateCRAM(g, colors)
  addr = 0
  for i in xrange(8): # Pattern 0
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("00000000,\n") # Black Square   
    addr += 4
  for i in xrange(4): # Pattern 1
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("11111111,\n")
    addr += 4
  for i in xrange(4):
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("11110000,\n") # Top-Left Corner
    addr += 4
  for i in xrange(4): # Pattern 2
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("11111111,\n")
    f.write("00000000,\n")
    addr += 4
  for i in xrange(4):
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("00000000,\n") # Top Edge
    addr += 4
  for i in xrange(4): # Pattern 3
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("11111111,\n")
    f.write("11111111,\n")
    addr += 4
  for i in xrange(4):
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("00001111,\n")
    f.write("00001111,\n") # Top-Right Corner
    addr += 4
  for i in xrange(8): # Pattern 4
    f.write("00000000,\n")
    f.write("00001111,\n")
    f.write("00000000,\n")
    f.write("00000000,\n") # Right Edge
    addr += 4
  for i in xrange(4): # Pattern 5
    f.write("00000000,\n")
    f.write("00001111,\n")
    f.write("00000000,\n")
    f.write("00001111,\n")
    addr += 4
  for i in xrange(4):  
    f.write("00000000,\n")
    f.write("11111111,\n")
    f.write("00000000,\n")
    f.write("11111111,\n") # Bottom-Right Corner
    addr += 4
  for i in xrange(4): # Pattern 6
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("00000000,\n")
    addr += 4
  for i in xrange(4):
    f.write("00000000,\n")
    f.write("11111111,\n")
    f.write("11111111,\n")
    f.write("00000000,\n") # Bottom Edge
    addr += 4
  for i in xrange(4): # Pattern 7
    f.write("00000000,\n")
    f.write("11110000,\n")
    f.write("11110000,\n")
    f.write("11110000,\n") 
    addr += 4
  for i in xrange(4):
    f.write("00000000,\n")
    f.write("11111111,\n")
    f.write("11111111,\n")
    f.write("11111111,\n") # Bottom-Left Corner
    addr += 4
  for i in xrange(8): # Pattern 8
    f.write("11110000,\n")
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("00000000,\n") # Left Edge
    addr += 4
 
  addr += writeText(f)  
  
  while addr < 0x3800:
    f.write("00000000,\n")
    addr += 1

  # Create the screen map
  f.write("00000011,\n")
  f.write("00000000,\n") 
  for i in xrange(30):
    f.write("00000010,\n")
    f.write("00000000,\n")
  f.write("00000001,\n")
  f.write("00000000,\n") # 32 
  for i in xrange(11):
    f.write("00000100,\n")
    f.write("00000000,\n") 
    for i in xrange(30):
      f.write("00000000,\n")
      f.write("00000000,\n")
    f.write("00001000,\n")
    f.write("00000000,\n") # 32 * 11

  # Write Message
  f.write("00000100,\n")
  f.write("00000000,\n") 
  for i in xrange(11):
    f.write("00000000,\n")
    f.write("00000000,\n")

  f.write("00001001,\n")
  f.write("00000000,\n")
  f.write("00001010,\n")
  f.write("00000000,\n")
  f.write("00001011,\n")
  f.write("00000000,\n")
  f.write("00001100,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00001101,\n")
  f.write("00000000,\n")
  f.write("00001110,\n")
  f.write("00000000,\n")
  f.write("00001010,\n")
  f.write("00000000,\n")

  for i in xrange(11):
    f.write("00000000,\n")
    f.write("00000000,\n")
  f.write("00001000,\n")
  f.write("00000000,\n")

  for i in xrange(10):
    f.write("00000100,\n")
    f.write("00000000,\n") 
    for i in xrange(30):
      f.write("00000000,\n")
      f.write("00000000,\n")
    f.write("00001000,\n")
    f.write("00000000,\n") # 32 * 10
  f.write("00000101,\n")
  f.write("00000000,\n") 
  for i in xrange(30):
    f.write("00000110,\n")
    f.write("00000000,\n")
  f.write("00000111,\n")
  f.write("00000000,\n") # 32
  addr += 1536

  while addr < 0x3F00:
    f.write("00000000,\n")
    addr += 1

  # Make SAT

  f.write("00000000,\n")
  f.write("11010000,\n")
  for i in xrange(126):
    f.write("00000000,\n")
  f.write("00000011,\n")
  f.write("00001001,\n")
  for i in xrange(126):
    f.write("00000000,\n")

def writeText(f): # Returns number of bytes written
  # F
  f.write("00111110,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00111110,\n")
  f.write("00000010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00000010,\n")
  f.write("00000010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00000010,\n")
  f.write("00111111,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00111111,\n")
  f.write("00000010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00000010,\n")
  f.write("00000010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00000010,\n")
  f.write("00000010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00000010,\n")
  f.write("00000010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00000010,\n")

  # U

  f.write("00100010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00100010,\n")
  f.write("00100010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00100010,\n")
  f.write("00100010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00100010,\n")
  f.write("00100010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00100010,\n")
  f.write("00100010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00100010,\n")
  f.write("00100010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00100010,\n")
  f.write("00100010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00100010,\n")
  f.write("00011100,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00011100,\n")

  # C

  f.write("00011100,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00011100,\n")
  f.write("00100010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00100010,\n")
  f.write("00000010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00000010,\n")
  f.write("00000010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00000010,\n")
  f.write("00000010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00000010,\n")
  f.write("00000010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00000010,\n")
  f.write("00100010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00100010,\n")
  f.write("00011100,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00011100,\n")

  # K

  f.write("00100010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00100010,\n")
  f.write("00010010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00010010,\n")
  f.write("00001010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00001010,\n")
  f.write("00000110,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00000110,\n")
  f.write("00000110,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00000110,\n")
  f.write("00001010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00001010,\n")
  f.write("00010010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00010010,\n")
  f.write("00100010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00100010,\n")

  # Y 

  f.write("00100010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00100010,\n")
  f.write("00010100,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00010100,\n")
  f.write("00001000,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00001000,\n")
  f.write("00001000,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00001000,\n")
  f.write("00001000,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00001000,\n")
  f.write("00001000,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00001000,\n")
  f.write("00001000,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00001000,\n")
  f.write("00001000,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00001000,\n")

  # O

  f.write("00011100,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00011100,\n")
  f.write("00100010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00100010,\n")
  f.write("00100010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00100010,\n")
  f.write("00100010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00100010,\n")
  f.write("00100010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00100010,\n")
  f.write("00100010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00100010,\n")
  f.write("00100010,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00100010,\n")
  f.write("00011100,\n")
  f.write("00000000,\n")
  f.write("00000000,\n")
  f.write("00011100,\n")

  return 192

def makeBoringImage(f, g):
  f.write("memory_initialization_radix=2;\nmemory_initialization_vector=\n")
  # Character Patterns
  colors = {}
  colors["00000000"] = "0000"
  colors["00001111"] = "0001"
  colors["00111100"] = "0010"
  colors["00110011"] = "0011" 
  colors["00111111"] = "0100"
  populateCRAM(g, colors)
  addr = 0
  for i in xrange(8): # Pattern 0
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("01010101,\n") # Yellow ||   
    addr += 4
  for i in xrange(8): # Pattern 1
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("01010101,\n")
    f.write("00000000,\n") # Cyan ||  
    addr += 4
  for i in xrange(8): # Pattern 2
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("01010101,\n")
    f.write("01010101,\n") # Magenta ||  
    addr += 4
  for i in xrange(8): # Pattern 3
    f.write("00000000,\n")
    f.write("01010101,\n")
    f.write("00000000,\n")
    f.write("00000000,\n") # White ||  
    addr += 4
  for i in xrange(4): # Pattern 4
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("00000000,\n") 
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("01010101,\n") # Yellow =
    addr += 8
  for i in xrange(4): # Pattern 5
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("00000000,\n") 
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("01010101,\n")
    f.write("00000000,\n") # Cyan =
    addr += 8
  for i in xrange(4): # Pattern 6
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("00000000,\n") 
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("01010101,\n")
    f.write("01010101,\n") # Magenta =
    addr += 8
  for i in xrange(4): # Pattern 7
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("00000000,\n")
    f.write("00000000,\n") 
    f.write("00000000,\n")
    f.write("01010101,\n")
    f.write("00000000,\n")
    f.write("00000000,\n") # White =
    addr += 8
  while addr < 0x3800:
    f.write("00000000,\n")
    addr += 1

  # Create the screen map
  while (addr < 0x3FFF):
    for i in xrange(4):
      f.write("00000000,\n")
      f.write("00000000,\n") # Pattern 0
      f.write("00000100,\n")
      f.write("00000000,\n") # Pattern 4
      f.write("00000001,\n")
      f.write("00000000,\n") # Pattern 1
      f.write("00000101,\n")
      f.write("00000000,\n") # Pattern 5
      f.write("00000010,\n")
      f.write("00000000,\n") # Pattern 2
      f.write("00000110,\n")
      f.write("00000000,\n") # Pattern 6
      f.write("00000011,\n")
      f.write("00000000,\n") # Pattern 3
      f.write("00000111,\n")
      f.write("00000000,\n") # Pattern 7    
    for i in xrange(4):
      f.write("00000100,\n")
      f.write("00000000,\n") # Pattern 4
      f.write("00000000,\n")
      f.write("00000000,\n") # Pattern 0
      f.write("00000101,\n")
      f.write("00000000,\n") # Pattern 5
      f.write("00000001,\n")
      f.write("00000000,\n") # Pattern 1
      f.write("00000110,\n")
      f.write("00000000,\n") # Pattern 6
      f.write("00000010,\n")
      f.write("00000000,\n") # Pattern 2
      f.write("00000111,\n")
      f.write("00000000,\n") # Pattern 7
      f.write("00000011,\n")
      f.write("00000000,\n") # Pattern 3
    addr += 0x80

def genPats(image, f):
  
  palettes = {}
  nextPalette = 0
  bytesWritten = 0

  with open(image, "r") as im:
    byteArray = bytearray(im.read())
    
    # Iterate over the 768 character pattern locations in the screen
    for i in xrange(12): #24
      for j in xrange(16): #32

        # Iterate over an individual 8x8 pixel pattern
        for a in xrange(8): #8
          arrayOfPixels = []
          for b in xrange(8):
            pixel = "00"

            # Iterate over the 3 color components in a pixel
            for c in xrange(3):
	      pixelComp = byteArray[((b * c + j) * 8) + ((a + i) * 384)] / 64
	
	      # Create a CRAM entry of "00_BB_GG_RR"
	      pixel += {
	        3:"11",
	        2:"10",
	        1:"01",
	        0:"00"
	      }[pixelComp]
	      #4 possible shades - Concatenating in the right order?
       
            # Map 8-bit CRAM entries to 4-bit palettes
            if (pixel not in palettes):
	      mappedPalette = "".join(bin(nextPalette)[2:].zfill(4))
	      palettes[pixel] = mappedPalette 
	      nextPalette += 1
	      nextPalette = nextPalette & 15
            arrayOfPixels += [palettes[pixel]]
          print(arrayOfPixels)
          pixelMap = [[0] for y in xrange(8)]
          for b in xrange(8):
            pixelMap[b] = list(arrayOfPixels[b])

          # Transpose the matrix to allow easy reading of the palettes
          newPixelMap = np.transpose(pixelMap)
          print(pixelMap)
          print(newPixelMap)
          for b in xrange(4):
            f.write(str("".join(newPixelMap[b])))
            f.write("\n")
            bytesWritten += 1
  return (bytesWritten, palettes)

def populateCRAM(file, colors):
  file.write("memory_initialization_radix=2;\nmemory_initialization_vector=\n")
  mem = [""] * 16
  addr = 0
  for colorIndex in colors:
    # print(colorIndex + " : " + str(int(colorIndex, 2)))
    mem[int(colors[colorIndex], 2)] = colorIndex
  for entry in mem:
    file.write(entry)
    file.write("\n")
    addr += 1
  while addr < 32:
    file.write("00000000,\n")
    addr += 1

def genHexFile(image):
  
  f = open("VRAM.bin", "w")
  g = open("CRAM.bin", "w")
  addr = 0

  # Iterate over the address space - VRAM should look like this:
  # $0000-3800 - Character Patterns
  # $3800-3F00 - Screen Map
  # $3F00-3FFF - Sprite Attribute Table - Implement later
  
  # Character Patterns
  f.write("// Begin Character Patterns\n")
  bytesWritten, colors = genPats(image, f)
  addr += bytesWritten
  populateCRAM(g, colors)
  while (addr < 0x3800):
    f.write("00000000\n") 
    addr += 1

  # Create the screen map
  f.write("// Begin Screen Map\n")
  for i in xrange(2):
    for j in xrange(2):
      for a in xrange(12):
        for b in xrange(16):
          charIndex = a * 16 + b
          f.write(bin(charIndex)[3:].zfill(8))
          f.write("\n")
          f.write("0000000" + bin(charIndex)[2])
          f.write("\n")
          addr += 2
  while (addr < 0x3FFF):
    f.write("00000000\n")
    addr += 1

# im = "imgNew.png"
# genHexFile(im)

f = open("VRAM.bin", 'w')
g = open("CRAM.bin", 'w')
makeSquare(f, g)
