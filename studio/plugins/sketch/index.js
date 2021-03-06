const generateLibrary = require("@lona/workspace-to-sketch-library");
const { sendRequest } = require("stdio-jsonrpc");
const {
  createNewSketchFile,
  writeSketchFile,
  generateId
} = require("sketch-file");
const requestUserParameters = require("./lib/request-user-parameters");

Promise.all([
  sendRequest("workspacePath"),
  sendRequest("compilerPath"),
  sendRequest("devicePresetList"),
  requestUserParameters()
])
  .then(
    ([
      workspace,
      compiler,
      devicePresetList,
      { sketchFilePath, componentPathFilter }
    ]) => {
      return generateLibrary(workspace, sketchFilePath, {
        devicePresetList,
        compiler,
        componentPathFilter,
        logFunction: console.error.bind(console)
      });
    }
  )
  .catch(x => console.error(x))
  .then(() => process.exit(0));
