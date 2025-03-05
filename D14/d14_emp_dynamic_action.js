apex.server.process('DEPT_FILTER', {
    x01: "DEPTNO",
    x02: $(this.triggeringElement).attr('data-id'),
    x03: "EQ"
}).then((pData) => {
    apex.region('ir-emp').refresh();
}).catch((err) => {
    console.error('Error in AJAX process:', err);
});
