//
//  RickAndMortyAPITests.swift
//  RickAndMortyAPITests
//
//  Created by Eduardo Javier Mejia Valdiviezo on 16/10/25.
//

import XCTest
@testable import RickAndMortyAPI

final class CharacterListViewModelTests: XCTestCase {
    func testFetchCharactersSuccess() async {
        let mockRepo = CharacterRepositoryMock()
        let viewModel = CharacterListViewModel(repository: mockRepo)

        await viewModel.fetchCharacters()

        XCTAssertFalse(viewModel.characters.isEmpty)
        XCTAssertNil(viewModel.errorMessage)
    }
}
