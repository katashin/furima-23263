if (document.URL.match(/new/)){
document.addEventListener("DOMContentLoaded", () => {
  const ImageList = document.getElementById("item-view");
  document.getElementById("item-image").addEventListener("change", (e) => {
    const imageContent = document.querySelector(".item-view")
    if (imageContent){
      imageContent.remove();
    }
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    const blobImage = document.createElement("img");
    blobImage.setAttribute("class", "item-view");
    blobImage.setAttribute("src", blob);

    ImageList.appendChild(blobImage);
  });
});
};