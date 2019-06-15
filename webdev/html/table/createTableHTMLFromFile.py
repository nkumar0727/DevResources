'''
<tr>
  <td>name</td>
  <td>imageUrl</td>
  <td>type</td>
  <td>evolution</td>
</tr>
'''
class FileObject:
  def __init__(self, name, imageUrl, type, evolution, evoWiki):
    self.name = name
    self.imageUrl = imageUrl
    self.type = type
    self.evolution = evolution
    self.evoWiki = evoWiki
  
  def createHTMLTableEntryString(self):
    return """
      <tr>
        <td>{}</td>
        <td><img src="{}"></td>
        <td>{}</td>
        <td><a href="{}">{}</a></td>
      </tr>
    """.format(self.name, self.imageUrl, self.type, self.evolution, self.evoWiki)

  def printObject(self):
    print(self.createHTMLTableEntryString())

def createFileObjectsFromFile(filepath):
  fileObjectList = []
  with open(filepath) as file:
    line = next(file, None) 
    state = ""
    name = None
    imageUrl = None
    tp = None
    evolution = None
    evoWiki = None
    while line:
      oldLine = str(line).strip()
      line = next(file, None)
      if "Name" in oldLine:
        name = str(line).strip()       
        line = next(file, None)
      elif "Image" in oldLine:
        imageUrl = str(line).strip()
        line = next(file, None)
      elif "Type" in oldLine:
        tp = str(line).strip()
        line = next(file, None)
      elif "Evolves To" in oldLine:
        evoWiki = str(line).strip()
        evolution = str(next(file, None)).strip()
        fileObjectList.append(FileObject(name, imageUrl, tp, evolution, evoWiki))
  return fileObjectList
        
def writeObjectListToFile(objectList, filepath):
  with open(filepath, "w") as file:
    for obj in objectList:
      file.write(obj.createHTMLTableEntryString())

objectList = createFileObjectsFromFile("./data.txt")
writeObjectListToFile(objectList, "./data.html")
