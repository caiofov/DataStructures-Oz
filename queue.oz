declare
fun {NewQueue} %creates a new queue
    queue(nil nil)
end

fun {Check Queue}
    case Queue of q(nil Back) then
        queue({Reverse Back} nil)
    else
        Queue 
    end
end

fun {Insert Queue X}
    case Queue of queue(Front Back) then
        {Check queue(Front X|Back)}
    end
end

fun {Delete Queue X}
    case Queue of 
    q(nil nil) then
        raise "Empty queue" end
    [] q(Front Back) then
        F1 in 
            Front = X|F1
            {Check queue(F1 Back)}
    end
end

fun {IsEmpty Queue}
    case Queue of queue(Front Back) then
        Front == nil
    end
end

%some list function - - -- - 
fun {Reverse L}
    case L of nil then
        nil
    [] X|Xr then
        {Append {Reverse Xr} [X]}
    end
end
fun {Append List X} %add X to the end of the list
    case List of
    nil then
        X
    [] E|L then
        E|{Append L X}
    end
end


declare Q 
Q = {NewCell {NewQueue}}
Q := {Insert @Q 2}
{Browse @Q}
{Browse {IsEmpty @Q}}