new Vue({
    el: '#app2',
    data() {
        return {
            email: '',
            password: '',
            status: '',
            msg: ''
        }
    },

    mounted() {        
    },
    methods: {
        submitAccount () {
            console.log("working here")
            // axios
            //     .get('https://api.coindesk.com/v1/bpi/currentprice.json')
            //     .then(response => (this.message = response.data.chartName))
            
            axios
                .post('http://localhost:5500/api/CreateAccount', {email: this.email, password: this.password})
                .then(response => (
                    this.msg = response.data.status,
                    (this.msg == 'success') ? window.location = "medhistory.html" : 'errors!'                                     
                    )                    
                )             
                // .then(() => ((this.msg == 'success')?this.status = 'Submitted! Thanks.':''))
                // .then(
                //     (this.msg == 'success') ? this.status = 'Submitted! Thanks.' : '',
                //     console.log('then ...')
                // )
                .catch(function (error) {
                    console.log(error);
                })
            
        }
    }
})