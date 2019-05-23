defmodule ExtensorInference.ConsignmentInference do
  alias ImageClassification.InferenceService, as: IS

  def consignment_inference do
    model_path = "./pre_trained_model/model.pb"
    label_path = "./labels.txt"
    io_json_path = "./pre_trained_model/io.json"
    service = %IS{graph: model_path, label: label_path, io_info: io_json_path}
    IS.load_model(service)

    image_paths = Path.wildcard("./images/**")
    Enum.each(image_paths, fn(image_path) ->
      image_path
      |> IS.load_image()
      |> IS.inference()
    end)
  end

end

ExtensorInference.ConsignmentInference.consignment_inference()
