%% Training
alex_table = readtable('AlexNet_Bal_Training.xlsx');
ImageID = alex_table.ImageID;
Alex_WH = alex_table.WaterHeaterPresent;
Alex_Rust = alex_table.RustPresent;
alex_table = table(ImageID, Alex_WH, Alex_Rust);

vgg16_table = readtable('VGG16_Bal_Training.xlsx');
ImageID = vgg16_table.ImageID;
vgg16_WH = vgg16_table.WaterHeaterPresent;
vgg16_Rust = vgg16_table.RustPresent;
vgg16_table = table(ImageID, vgg16_WH, vgg16_Rust);

vgg19_table = readtable('VGG19_Bal_Training.xlsx');
ImageID = vgg19_table.ImageID;
vgg19_WH = vgg19_table.WaterHeaterPresent;
vgg19_Rust = vgg19_table.RustPresent;
vgg19_table = table(ImageID, vgg19_WH, vgg19_Rust);

inception_table = readtable('InceptionResults_Bal_Training.xlsx');
ImageID = inception_table.ImageID;
inception_WH = inception_table.WaterHeaterPresent;
inception_Rust = inception_table.RustPresent;
inception_table = table(ImageID, inception_WH, inception_Rust);

orig_truth_table = readtable('C:\AllState_Code\trunk\AllstateCode\PhotoTruthAndMeta.xlsx');
ImageID = orig_truth_table.ImageID;
truth_WH = orig_truth_table.HasWaterHeaterTruth;
truth_Rust = orig_truth_table.HasRustTruth;
truth_table = table(ImageID, truth_WH, truth_Rust);

meshData = innerjoin(alex_table, vgg16_table, 'Key', 'ImageID');
meshData = innerjoin(meshData, vgg19_table, 'Key', 'ImageID');
meshData = innerjoin(meshData, inception_table, 'Key', 'ImageID');
meshData = innerjoin(meshData, truth_table, 'Key', 'ImageID');

X = [meshData.Alex_WH, meshData.vgg16_WH, meshData.vgg19_WH, meshData.inception_WH];
Y = meshData.truth_WH;

WH_SVM = fitcsvm(X,Y);
[predictedLabels, score] = predict(WH_SVM,X);
accuracy = sum(predictedLabels==Y)/numel(predictedLabels)

X = [meshData.Alex_Rust, meshData.vgg16_Rust, meshData.vgg19_Rust, meshData.inception_Rust];
Y = meshData.truth_Rust;

Rust_SVM = fitcsvm(X,Y);
[predictedLabels, score] = predict(Rust_SVM,X);
accuracy = sum(predictedLabels==Y)/numel(predictedLabels)

%% Test
alex_table = readtable('AlexNet_Bal_Test.xlsx');
ImageID = alex_table.ImageID;
Alex_WH = alex_table.WaterHeaterPresent;
Alex_Rust = alex_table.RustPresent;
alex_table = table(ImageID, Alex_WH, Alex_Rust);

vgg16_table = readtable('VGG16_Bal_Test.xlsx');
ImageID = vgg16_table.ImageID;
vgg16_WH = vgg16_table.WaterHeaterPresent;
vgg16_Rust = vgg16_table.RustPresent;
vgg16_table = table(ImageID, vgg16_WH, vgg16_Rust);

vgg19_table = readtable('VGG19_Bal_Test.xlsx');
ImageID = vgg19_table.ImageID;
vgg19_WH = vgg19_table.WaterHeaterPresent;
vgg19_Rust = vgg19_table.RustPresent;
vgg19_table = table(ImageID, vgg19_WH, vgg19_Rust);

inception_table = readtable('InceptionResults_Bal_Test.xlsx');
ImageID = inception_table.ImageID;
inception_WH = inception_table.WaterHeaterPresent;
inception_Rust = inception_table.RustPresent;
inception_table = table(ImageID, inception_WH, inception_Rust);

orig_truth_table = readtable('C:\AllState_Code\trunk\AllstateCode\PhotoTruthAndMeta.xlsx');
ImageID = orig_truth_table.ImageID;
truth_WH = orig_truth_table.HasWaterHeaterTruth;
truth_Rust = orig_truth_table.HasRustTruth;
truth_table = table(ImageID, truth_WH, truth_Rust);

meshData = innerjoin(alex_table, vgg16_table, 'Key', 'ImageID');
meshData = innerjoin(meshData, vgg19_table, 'Key', 'ImageID');
meshData = innerjoin(meshData, inception_table, 'Key', 'ImageID');
meshData = innerjoin(meshData, truth_table, 'Key', 'ImageID');

X = [meshData.Alex_WH, meshData.vgg16_WH, meshData.vgg19_WH, meshData.inception_WH];
Y = meshData.truth_WH;

[predictedLabels, score] = predict(WH_SVM,X);
accuracy = sum(predictedLabels==Y)/numel(predictedLabels)
WaterHeaterPresent = predictedLabels;

X = [meshData.Alex_Rust, meshData.vgg16_Rust, meshData.vgg19_Rust, meshData.inception_Rust];
Y = meshData.truth_Rust;

[predictedLabels, score] = predict(Rust_SVM,X);
accuracy = sum(predictedLabels==Y)/numel(predictedLabels)
RustPresent = predictedLabels;
RustSeverity = predictedLabels;
ImageID = meshData.ImageID;
tableResults = table( ImageID,...
                 WaterHeaterPresent,...
                 RustPresent,...
                 RustSeverity);
writetable(tableResults, 'SVM_Output.xlsx');
