
#!/bin/bash

# readonly TEST_DATA="/usr/share/edgetpudemo"
# readonly VIDEO_DEVICE_FILE="${TEST_DATA}/video_device.mp4"
# readonly VIDEO_STREAM_FILE="${TEST_DATA}/video_stream.mp4"
# readonly TPU_MODEL_FILE="${TEST_DATA}/mobilenet_ssd_v1_coco_quant_postprocess_edgetpu.tflite@Running MobileNet SSD v1 on Edge TPU"
# readonly CPU_MODEL_FILE="${TEST_DATA}/mobilenet_ssd_v1_coco_quant_postprocess.tflite@Running MobileNet SSD v1 on CPU"
# readonly LABELS_FILE="${TEST_DATA}/coco_labels.txt"

while [ $# -gt 0 ] ; do
  case $1 in
    -s | --source) S="$2" ;;
    -m | --model) M="$2" ;;
    -l | --labels) L="$2" ;;

  esac
  shift
done




# reef_detect_server --enable_ai \
  #     --source "${S}" \
  #     --model "${M}" \
  #     --labels "${L}" \
  #     --max_area 0.1 \
  #     --loop

echo $S $M, $L 
