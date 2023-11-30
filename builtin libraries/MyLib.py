# coding=utf-8
from robot.libraries.BuiltIn import BuiltIn

class MyLib:

####Keyword implementation####
   def count_words(self, paragraph):
        """
        :param paragraph: String
        :return: Number of words
        """
        word_list = paragraph.split()
        return len(word_list)