import json
class Settings:

    def getRes(cam):
        with open('/home/mendel/ReefVision/Reef_Vision/settings.json') as f:
            data = json.load(f)
        resolution = data[cam]["resolution"].split("x")
        return(int(resolution[0]),int(resolution[1]))
    
    def getFPS(cam):
        with open('/home/mendel/ReefVision/Reef_Vision/settings.json') as f:
            data = json.load(f)
        fps = int(data[cam]["fps"])
        return fps

    def getCamID(cam):
        with open('/home/mendel/ReefVision/Reef_Vision/settings.json') as f:
            data = json.load(f)
        camID = int(data[cam]["device"])
        return camID