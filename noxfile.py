import nox


@nox.session(python=["3.8", "3.9", "3.10", "3.11"])
def tests(session):
    session.install(".[all]")
    # session.install("pytest", "pytest-xdist")
    # session.install("pytest-xdist")
    session.run("pytest", "-n", "auto")


@nox.session
def lint(session):
    session.install("ruff")
    session.install("black")
    session.run("black", ".", "--check")
    session.run("ruff", "check", ".")
