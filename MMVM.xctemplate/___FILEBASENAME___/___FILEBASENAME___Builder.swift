//___FILEHEADER___

final class ___VARIABLE_productName___Builder {
    private let dependency: ___VARIABLE_productName___Dependency
    private let parentRouter: ___VARIABLE_productName___ParentRouter

    init(dependency: ___VARIABLE_productName___Dependency, parentRouter: ___VARIABLE_productName___ParentRouter) {
        self.dependency = dependency
        self.parentRouter = parentRouter
    }

    func build() -> ___VARIABLE_productName___Result {
        let viewState = ___VARIABLE_productName___ViewState()
        let router = App___VARIABLE_productName___Router(parent: parentRouter, viewState: viewState)

        let state = ___VARIABLE_productName___State()
        let viewModel = ___VARIABLE_productName___ViewModel(state: state, router: router)

        let view = ___VARIABLE_productName___View(viewModel: viewModel, state: state, viewState: viewState)

        return ___VARIABLE_productName___Result(view: view, output: viewModel)
    }
}
