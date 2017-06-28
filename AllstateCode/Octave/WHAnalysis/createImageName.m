function imageName = createImageName(idxNumber, hasWH, hasRust, rustSeverity, isTraining)

  if (isTraining)
      imageName = ['TrainingImage_' num2str(idxNumber)];
  else
      imageName = ['TestImage_' num2str(idxNumber)];
  end
    
  if(hasWH)
      imageName = [imageName '_WH'];
  else
      imageName = [imageName '_Noise'];
  end
  
  
  if(hasRust)
      imageName = [imageName '_Rust_' num2str(rustSeverity)];
  end
  
  imageName = [imageName '.jpg'];

end