let project = new Project('Kog Testing');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addShaders('Sources/Shaders/**');
project.addLibrary('../../../../kog');
resolve(project);
