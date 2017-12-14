DATA_PATH='../../data'
IMAGE_SIZE='48-80'
DATASET_SOURCE='LIN_Normalized_WT_size-'${IMAGE_SIZE}
DATASET_NAME=${DATASET_SOURCE}'_6class'

CLASSES='yeast'
SPLITS='train test'

for SPLIT in ${SPLITS};
do
	SOURCE_PATH=${DATA_PATH}/${DATASET_SOURCE}_${SPLIT}
	TARGET_PATH=${DATA_PATH}/${DATASET_NAME}_${SPLIT}
	mkdir -p ${TARGET_PATH}

	for CLASS in ${CLASSES};
	do
		if [ -d ${TARGET_PATH}/${CLASS} ]; then
			echo 'Removing old '${TARGET_PATH}/${CLASS}
			  if [ -L ${TARGET_PATH}/${CLASS} ]; then
			    rm ${TARGET_PATH}/${CLASS}
			  else
			    rmdir ${TARGET_PATH}/${CLASS}
			  fi
			rm -rf ${TARGET_PATH}/${CLASS}
		fi
		echo 'Creating '${TARGET_PATH}/${CLASS}
		ln -rs ${SOURCE_PATH}/${CLASS} ${TARGET_PATH}/${CLASS}
	done
done
