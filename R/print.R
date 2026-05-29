

rd2char <- function(x, n = 1) {
  tag <- attr(x, "Rd_tag")

  if (is.null(tag)) {
    if (n == 1) {
      tag <- deparse(substitute(x))
    } else {
      tag <- "NULL"
    }

  }
  if (!is.list(x)) {
    x <- gsub("\\n", "\\\\n", x)
    return(paste0("<", tag, "> ", '"', x, '"'))
  }
  sep <- paste0("\n", strrep("  ", n), "└─")
  elements <- vapply(seq_along(x), function(i)
    paste0(sep, "[", i, "]", rd2char(x[[i]], n = n + 2)), FUN.VALUE = character(1))

  elements <- paste0(elements, collapse = "")


  out <- paste0("<", tag, ">", elements)

  return(out)
}

#' @export
print.Rd <- function(x, ...) {
  cat(rd2char(x, n = 1))
}

list2char <- function(x, title = NULL, n = 1) {
  if (is.null(title)) {
    if (n == 1) {
      title <- deparse(substitute(x))
    } else {
      title <- ""
    }

  }
  if (!is.list(x)) {
    x <- gsub("\\n", "\\\\n", x)
    return(paste0("$", title, ": ", '"', x, '"'))
  }
  sep <- paste0("\n", strrep("  ", n), "└─")
  elements <- vapply(seq_along(x), function(i)
    paste0(sep, "[", i, "]", list2char(
      x[[i]], title = names(x)[i], n = n + 2
    )), FUN.VALUE = character(1))

  elements <- paste0(elements, collapse = "")

  out <- paste0("$", title, ": ", elements)


  return(out)
}

#' @export
print.rdlist <- function(x, ...) {
  title <- deparse(substitute(x))
  cat(list2char(x, title, n = 1))
}
