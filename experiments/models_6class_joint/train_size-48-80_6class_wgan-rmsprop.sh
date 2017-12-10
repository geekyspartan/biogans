ROOT_PATH='../..'
RESULT_PATH="${ROOT_PATH}/models/size-48-80_6class_wgan-rmsprop"

mkdir -p ${RESULT_PATH}

python3 ${ROOT_PATH}/code/main.py --dataroot ${ROOT_PATH}/data/LIN_Normalized_WT_size-48-80_6class_train/ --image_height 48 --image_width 80 --num_iter 20 --experiment ${RESULT_PATH} --dataset_type folder-cached --model_type DCGAN --GAN_algorithm WGAN --num_disc_iters 5 --optimizer rmsprop --lrD 0.00005 --lrG 0.00005  --fixed_noise_file fixed_noise_batch64_dim100.pth  | tee ${RESULT_PATH}/train_stdout.txt
