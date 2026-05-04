exports.handler = async (event) => {
  const fileName = event.detail.object.key;
  console.log("Archivo subido:", fileName);
};
