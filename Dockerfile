FROM nvcr.io/nvidia/pytorch:21.02-py3

RUN apt-get update && \
    apt-get install -y git wget && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/zhenzhel/lift_map_detect.git /app

WORKDIR /app

RUN python -m pip install \
        packaging \
        tensorflow-gpu==2.9.0 \
        tensorflow-gan==2.0.0 \
        tensorflow-probability==0.16.0 \
        tensorflow-hub==0.11.0 \
        "jax[cpu]" \
        tensorflow_datasets \
        ml-collections \
        scikit-image==0.19.2 \
        lpips \
        scikit-learn==1.0.2 \
        protobuf==3.20.1 \
        tqdm

CMD ["/bin/bash"]
