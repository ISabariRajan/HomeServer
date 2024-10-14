from PIL import Image, ImageDraw, ImageFont
from PIL.ImageTk import PhotoImage
from os import listdir
from os.path import join as joinpath, dirname
import cv2
from cv2 import imencode, cvtColor, COLOR_BGRA2BGR, COLOR_RGB2BGR
import numpy as np
from pathlib import Path
import base64
import copy as cpy

def deepcopy(obj):
  return cpy.deepcopy(obj)

def copy(obj):
  return cpy.copy(obj)

def join(*args):
  return Path(joinpath(args[0], *args[1:]))

from settings import fonts_dir, images_dir, logos_dir

class Fonts:
  century_gothic = ImageFont.truetype(join(fonts_dir, "Century Gothic.ttf"), 100)
  kugile = ImageFont.truetype(join(fonts_dir, "Kugile_Demo.ttf"), 100)

fonts = Fonts()
# fonts.century_gothic.size = 100
# fonts.kugile.size = 30
class Colors:
  white_full = (255, 255, 255, 255)
  transparent = (255, 255, 255, 0)

colors = Colors()

class SharedObject:
  whatsapp_logo: Image
  company_logo: Image
  original_image: Image
  updated_image: Image
  whatsapp_contact_number: str = "+91-8015399392"

# 1 BOX 790D79 Opacity 40% 34.7727 Font Size

# 2 BOX 400542 Opacity 70% 28.4091 Font Size

# out line around 35 px


shared_obj = SharedObject()
from packages.image_process import ImageProcessor
img_processor = ImageProcessor()

from packages.generic_image_process import GenericImageProcess
gen_img_processor = GenericImageProcess()