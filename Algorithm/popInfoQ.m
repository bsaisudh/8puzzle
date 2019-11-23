function info = popInfoQ()
    global infoQ;
    %{
    if (size(infoQ,1) == 0)
        status = false;
        info = [];
    else
    %}
    info = infoQ(1,:);
    infoQ(1,:) = [];
    % status = true;
    % end
end