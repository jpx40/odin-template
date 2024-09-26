package template

import "base:runtime"
import "core:container/intrusive/list"
import "core:encoding/json"
import "core:fmt"
import "core:mem"
import "core:os"
import "core:reflect"
import "core:slice"
import "core:strings"


StmdPair :: struct {
    open:  Stmd,
    close: Stmd,
}
handle_stmd :: proc(l: ^Lexer) -> (err: Lexer_Error) {
    builder := strings.builder_make(context.temp_allocator)
    buf := make([dynamic]rune, context.temp_allocator)
    stmd_pos: Pos
    stmd_pos.start = l.cursor
    stmd_pos.start = l.line
    for r, i in l.src[l.cursor] {
        append(&buf, r)
        strings.write_rune(&builder, r)
        if r == '%' && l.src[i + 1] == '}' {
            stmd_pos.end = i

            break

        }


    }
    tmp_str: string = strings.to_string(b)
    // token_text, _ = strings.remove_all(
    //     tmp_str,
    //     " ",
    //     allocator = context.temp_allocator,
    // )
    if strings.contains(tmp_str, "for") &&
       !strings.contains(tmp_str, "endfor") {
        stmd := Stmd {
            pos  = Pos,
            type = SmtdTypes.ForOpen,
        }
        append(&l.stmds, stmd)


    } else if strings.contains(tmp_str, "if") &&
       !strings.contains(tmp_str, "endif") &&
       !strings.contains(tmp_str, "elseif") &&
       !strings.contains(tmp_str, "else if") {
        stmd := Stmd {
            pos  = Pos,
            type = SmtdTypes.IfOpen,
        }
        append(&l.stmds, stmd)


    } else if strings.contains(tmp_str, "elseif") ||
       strings.contains(tmp_str, "else if") {
        stmd := Stmd {
            pos  = Pos,
            type = SmtdTypes.ElseIf,
        }
        append(&l.stmds, stmd)


    } else if strings.contains(tmp_str, "else") {
        stmd := Stmd {
            pos  = Pos,
            type = SmtdTypes.Else,
        }
        append(&l.stmds, stmd)


    } else if strings.contains(tmp_str, "endif") {
        stmd := Stmd {
            pos  = Pos,
            type = SmtdTypes.IfClose,
        }
        append(&l.stmds, stmd)


    } else if strings.contains(tmp_str, "endfor") {
        stmd := Stmd {
            pos  = Pos,
            type = SmtdTypes.ForClose,
        }
        append(&l.stmds, stmd)


    }


}


find_pairs :: proc(l: ^Lexer) {


    list: list.List
    list.push_front(&list, &l.stmds[0].node)

    for p, i in l.stmds {


    }
}
//use queue
find_pairs_rec :: proc(
    s: [dynamic]Stmd,
    l: list.List,
    p: [dynamic]StmdPair,
    index: int,
) -> [dynamic]StmdPair {
    list.pop_front


}
extract_for :: proc(l: ^Lexer, tmp_str: string) {

    split := strings.split(tmp_str, "for", allocator = context.temp_allocator)


    trimmed := strings.trim_left_space(split[1])

    var_i := strings.split(trimmed, " ", allocator = context.temp_allocator)
    var := var_i[0]
    split_in := strings.split(
        tmp_str,
        "in",
        allocator = context.temp_allocator,
    )
    arr := split_in[1]


}

extract_if :: proc(l: ^Lexer, tmp_str: string) {
    if strings.contains(tmp_str, "<=") {
        split := strings.split(
            tmp_str,
            "<=",
            allocator = context.temp_allocator,
        )

        one := strings.remove_all(
            tmp_str,
            "{%",
            allocator = context.temp_allocator,
        )
        two := strings.remove_all(
            tmp_str,
            "%}",
            allocator = context.temp_allocator,
        )


    } else if strings.contains(tmp_str, ">=") {
        split := strings.split(
            tmp_str,
            ">=",
            allocator = context.temp_allocator,
        )
        one := strings.remove_all(
            tmp_str,
            "{%",
            allocator = context.temp_allocator,
        )
        two := strings.remove_all(
            tmp_str,
            "%}",
            allocator = context.temp_allocator,
        )

    } else if strings.contains(tmp_str, "==") {
        split := strings.split(
            tmp_str,
            "==",
            allocator = context.temp_allocator,
        )
        one := strings.remove_all(
            tmp_str,
            "{%",
            allocator = context.temp_allocator,
        )
        two := strings.remove_all(
            tmp_str,
            "%}",
            allocator = context.temp_allocator,
        )
    }
}
