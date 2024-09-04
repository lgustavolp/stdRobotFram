async function MockMySong(page) {
    
    //file nirvana.mp3 uploaded by the dev team to use in the test
    const testData = {
        "id": 1,
        "title": "Smells Like Test Script",
        "artist": "Nullvana",
        "description": "Nullvana",
        "image": "https://raw.githubusercontent.com/qaxperience/mock/main/covers/nevertesting.jpg",
        "type": "album",
        "src": "https://raw.githubusercontent.com/qaxperience/mock/main/songs/nirvana.mp3"
      }


    await page.route('**/songs', route => route.fulfill({
        status: 200,
        body: JSON.stringify([testData])
        // usa o colchete pq para a requisição do endpoint retorna um array de albuns
    }))
  }

  exports.__esModule = true;
  exports.MockMySong = MockMySong;
